require 'json'
require 'erb'
require 'tsort'

module XCResult
  class ModelGenerator
    def self.format_description
      `xcrun xcresulttool formatDescription get`
    end

    def self.generate(destination)
      parser = Parser.new(source: format_description)
      parser.parse
      generator = Generator.new(parser.source)
      generator.write(destination)
    end

    class Generator
      def initialize(source)
        @source = source
        @type_to_kind = source.types.map { |t| [t.name, t.kind] }.to_h
      end

      def write(destination)
        file = File.open(destination, 'w+')
        file.puts(<<~"HEADER")
        # This is a generated file. Don't modify this directly!
        # Last generated at: #{Time.now.utc}
        #
        # #{@source.name}
        # #{@source.version}
        # #{@source.signature}
        require 'time'

        HEADER

        file.puts(<<~TEMPLATE)
        module XCResult
          module Models

        TEMPLATE

        sorted_types.each do |type|
          type_text = compose_type(type, 2 * 2)
          file.puts(type_text)
          file.puts('')
        end

        file.puts(<<~TEMPLATE)
          end
        end
        TEMPLATE
      ensure
        file.close
      end

      # Use topological sort to correctly defines classes that may depend on another as its super class
      def sorted_types
        h = @source.types.map {|x| [x, [@source.types.find {|y| y.name == x.supertype}].compact] }.to_h
        each_node = ->(&b) { h.each_key(&b) }
        each_child = ->(n, &b) { h[n].each(&b) }
        TSort.tsort(each_node, each_child)
      end

      def compose_type(type, indentation)
        type_def = <<~"TYPE"
        <%= type.raw_text.each_line.map { |line| '# ' + line[2..-1] }.join %>
        <% if type.supertype %>
        class <%= type.name %> < <%= type.supertype %>
        <% else %>
        class <%= type.name %>
        <% end%>
        <% type.properties.each do |property| %>
          <%= property.rdoc_comment %>
          attr_reader :<%= property.name_in_snake_case %>
        <% end %>

          def initialize(data)
        <% type.properties.each do |property| %>
            @<%= property.name_in_snake_case %> = <%= property.mapping(type_to_kind[property.main_type], 'data') %>
        <% end %>
          end
        end
        TYPE
        type_def = ERB.new(type_def, trim_mode: '<>').result_with_hash(type: type, type_to_kind: @type_to_kind)
        type_def.each_line.map { |line| "#{' ' * indentation}#{line}" }.join
      end
    end

    class Parser
      attr_reader :source

      def initialize(source: )
        @raw_source = source
        @lines = source.each_line.to_a
        @source = Source.new
      end

      def parse
        @source.name = @lines.shift.chomp
        @source.version = @lines.shift.chomp
        @source.signature = @lines.shift.chomp

        # Drop "- Types" lines
        @lines.shift

        # Parsing Types
        types = []
        type = nil

        until @lines.empty?
          line = @lines.shift
          case line
          when /\s*-\s+(.*)$/
            types << type if type
            type = Type.new(name: Regexp.last_match(1), raw_text: line, properties: [])
          when /\s*\*\s*Supertype: (.*)$/
            type.supertype = Regexp.last_match(1)
            type.raw_text << line
          when /\s*\*\s*Kind: (.*)$/
            type.kind = Regexp.last_match(1)
            type.raw_text << line
          when /\s*\*\s*Properties:$/
            type.raw_text << line
            parse_properties(type)
          end
        end

        types << type if type
        @source.types = types
      end

      def parse_properties(type)
        while @lines.first =~ /\s*\+\s(?<name>.*):\s*(?<type>.*)$/
          optional = false
          array = false
          parsed_name = Regexp.last_match[:name]
          parsed_type = Regexp.last_match[:type]
          main_type = parsed_type

          if parsed_type =~ /^\[(.*)\]$/
            array = true
            main_type = Regexp.last_match[1]
          elsif parsed_type =~ /^(.*)\?$/
            optional = true
            main_type = Regexp.last_match[1]
          end
          type.properties << Property.new(name: parsed_name, type: parsed_type, main_type: main_type, optional: optional, array: array)
          type.raw_text << @lines.shift
        end
      end
    end

    Source = Struct.new(:name, :version, :signature, :types, keyword_init: true)
    Type = Struct.new(:name, :supertype, :kind, :properties, :raw_text, keyword_init: true)
    Property = Struct.new(:name, :type, :main_type, :optional, :array, keyword_init: true) do
      def name_in_snake_case
        name.gsub(/([a-z])(?=[A-Z])/) { (Regexp.last_match[1] || Regexp.last_match[2]) << '_' }.downcase
      end

      def mapping(kind, variable_name)
        return "(#{variable_name}.dig('#{name}', '_values') || []).map {|d| #{_mapping(kind, 'd')} }" if array

        _mapping(kind, variable_name) + (optional ? " if #{variable_name}['#{name}']" : '')
      end

      def _mapping(kind, variable_name)
        if kind == 'object'
          type_access_key = array ? "'_type', '_name'" : "'#{name}', '_type', '_name'"
          value_access_key = array ? variable_name : "#{variable_name}.dig('#{name}')"
          "Kernel.const_get(\"XCResult::Models::\#{#{variable_name}.dig(#{type_access_key})}\").new(#{value_access_key})"
        elsif kind == 'value' && main_type == 'Date'
          "Time.parse(#{variable_name}.dig('#{name}', '_value'))"
        elsif kind == 'value' && main_type == 'Int'
          "#{variable_name}.dig('#{name}', '_value').to_i"
        elsif kind == 'value' && main_type == 'Double'
          "#{variable_name}.dig('#{name}', '_value').to_f"
        else
          "#{variable_name}.dig('#{name}', '_value')"
        end
      end

      def rdoc_comment
        if array
          "# @return [Array<#{main_type}>] #{name}"
        elsif optional
          "# @return [#{main_type}, nil] #{name}"
        else
          "# @return [#{main_type}] #{name}"
        end
      end
    end
  end
end
