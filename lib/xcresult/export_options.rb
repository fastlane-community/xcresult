module XCResult
  class ExportOptions
    AVAILABLE_OPTIONS = %i[destination by_device by_locale].freeze

    def initialize(**options)
      raise ':destination option is required' unless options[:destination]

      options.each do |key, value|
        raise "Found unknown option #{key} - #{value}." unless AVAILABLE_OPTIONS.include?(key)
      end

      @options = options.dup
      @destination = options.delete(:destination)
    end

    def output_directory(target_device_record:, action_testable_summary:)
      output_directory = @destination

      # keep the order of given options so that you can customize output directory path based on your needs
      @options.each do |key, value|
        if key == :by_device && value == true
          output_directory = File.join(output_directory, target_device_record.model_name)
        elsif key == :by_locale && value == true
          locale = [action_testable_summary.test_language, action_testable_summary.test_region].compact.join('_')
          locale = 'UNKOWN' if locale.empty?
          output_directory = File.join(output_directory, locale)
        end
      end

      output_directory
    end
  end
end
