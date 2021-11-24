# frozen_string_literal: true

require 'json'
require 'erb'
require 'tsort'

module XCResult
  class ModelGenerator
    def self.format_description
      `xcrun xcresulttool formatDescription get --format json`
    end

    def self.generate(destination)
      parser = Parser.new(format: format_description)
      parser.parse
      generator = Generator.new(parser.format)
      generator.write(destination)
    end

    class Generator
      def initialize(format)
        @format = format
        @type_to_kind = format.types.map { |t| [t.name, t.kind] }.to_h
      end

      def write(destination)
        file = File.open(destination, 'w+')
        file.puts(<<~"HEADER")
          # This is a generated file. Don't modify this directly!
          # Last generated at: #{Time.now.utc}
          #
          # Name: #{@format.name}
          # Version: #{@format.version}
          # Signature: #{@format.signature}
          require 'time'

        HEADER

        file.puts(<<~OPEN_MODULE)
          module XCResult
            module Models

        OPEN_MODULE

        sorted_types.each do |type|
          type_text = compose_type(type, 2 * 2)
          file.puts(type_text)
          file.puts('')
        end

        file.puts(<<~CLOSE_MODULE)
            end
          end
        CLOSE_MODULE
      ensure
        file.close
      end

      # Use topological sort to correctly defines classes that may depend on another as its super class
      def sorted_types
        h = @format.types.map {|x| [x, [@format.types.find {|y| y.name == x.supertype}].compact] }.to_h
        each_node = ->(&b) { h.each_key(&b) }
        each_child = ->(n, &b) { h[n].each(&b) }
        TSort.tsort(each_node, each_child)
      end

      def compose_type(type, indentation)
        type_def = <<~"TYPE"
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
              @<%= property.name_in_snake_case %> = <%= property.mapping(type_to_kind[property.wrapped_type || property.type], 'data') %>
          <% end %>
          <% if type.supertype %>
              super
          <% end %>
            end
          end
        TYPE
        type_def = ERB.new(type_def, trim_mode: '<>').result_with_hash(type: type, type_to_kind: @type_to_kind)
        type_def.each_line.map { |line| "#{' ' * indentation}#{line}" }.join
      end
    end

    class Parser
      attr_reader :format

      def initialize(format:)
        @raw_format = format
        @json = JSON.parse(format)
        @format = Format.new
      end

      def parse
        @format.name = @json['name']
        @format.version = @json['version'].values.join('.')
        @format.signature = @json['signature']
        @format.types = @json['types'].map do |type|
          # We use Ruby native classes for values, like Date, String, Int, Double, etc..
          next if type['kind'] == 'value'

          Type.new(
            name: type.dig('type', 'name'),
            supertype: type.dig('type', 'supertype'),
            kind: type['kind'],
            raw_text: JSON.pretty_generate(type),
            properties: type.fetch('properties', []).map do |prop|
              Property.new(
                name: prop['name'],
                type: prop['type'],
                wrapped_type: prop['wrappedType'],
                is_optional: prop['isOptional'],
                is_internal: prop['isInternal']
              )
            end
          )
        end.compact
      end
    end

    Format = Struct.new(:name, :version, :signature, :types, keyword_init: true)
    Type = Struct.new(:name, :supertype, :kind, :properties, :raw_text, keyword_init: true)
    Property = Struct.new(:name, :type, :wrapped_type, :is_optional, :is_internal, keyword_init: true) do
      def name_in_snake_case
        name
          .gsub(/(CPU|ID|MHz|UTI|SDK)/) { Regexp.last_match[1].downcase.capitalize } # normalize acronyms
          .gsub(/([a-z])(?=[A-Z])/) { (Regexp.last_match[1] || Regexp.last_match[2]) << '_' }
          .downcase
      end

      def mapping(kind, variable_name)
        return "(#{variable_name}.dig('#{name}', '_values') || []).map {|d| #{_mapping(kind, 'd')} }" if type == 'Array'

        _mapping(kind, variable_name) + (is_optional ? " if #{variable_name}['#{name}']" : '')
      end

      def _mapping(kind, variable_name)
        if kind == 'object'
          type_access_key = type == 'Array' ? "'_type', '_name'" : "'#{name}', '_type', '_name'"
          value_access_key = type == 'Array' ? variable_name : "#{variable_name}.dig('#{name}')"
          "Models.load_class(#{variable_name}.dig(#{type_access_key})).new(#{value_access_key})"
        elsif kind == 'value' && [type, wrapped_type].include?('Date')
          "Time.parse(#{variable_name}.dig('#{name}', '_value'))"
        elsif kind == 'value' && [type, wrapped_type].include?('Int')
          "#{variable_name}.dig('#{name}', '_value').to_i"
        elsif kind == 'value' && [type, wrapped_type].include?('Double')
          "#{variable_name}.dig('#{name}', '_value').to_f"
        else
          "#{variable_name}.dig('#{name}', '_value')"
        end
      end

      def rdoc_comment
        if type == 'Array'
          "# @return [Array<#{wrapped_type}>] #{name_in_snake_case}"
        elsif is_optional
          "# @return [#{wrapped_type}, nil] #{name_in_snake_case}"
        else
          "# @return [#{type}] #{name_in_snake_case}"
        end
      end
    end
  end
end
