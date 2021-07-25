module XCResult
  class ExportOptions
    AVAILABLE_OPTIONS = %i[destination by_device by_locale by_region by_language by_os_version by_test_name].freeze

    # A initializer of ExportOptions class. The order of options that are prefixed with `by_` is important.
    # `XCResult::Parser#export_screenshots` will create nested directories by the order you give.
    #
    # @option [String] destination The base directory path of exported items
    # @option [Boolean] by_device If true, a nested directory under destination will be made based on device model name
    # @option [Boolean] by_locale If true, a nested directory under destination will be made based on locale; i.e. "en_US"
    # @option [Boolean] by_region If true, a nested directory under destination will be made based on region
    # @option [Boolean] by_language If true, a nested directory under destination will be made based on language
    # @option [Boolean] by_os_version If true, a nested directory under destination will be made based on OS version
    # @option [Boolean] by_test_name If true, a nested directory under destination will be made based on test name in TestPlan
    def initialize(**options)
      raise ':destination option is required' unless options[:destination]

      options.each do |key, value|
        raise "Found unknown option #{key} - #{value}." unless AVAILABLE_OPTIONS.include?(key)
      end

      @options = options.dup
      @destination = options.delete(:destination)
    end

    def output_directory(target_device_record:, action_test_plan_summary:, action_testable_summary:)
      output_directory = @destination

      # keep the order of given options so that you can customize output directory path based on your needs
      @options.select { |key, value| key.to_s.start_with?('by_') && value == true }.each do |key, _|
        case key
        when :by_device
          output_directory = File.join(output_directory, target_device_record.model_name)
        when :by_language
          output_directory = File.join(output_directory, action_testable_summary.test_language)
        when :by_region
          output_directory = File.join(output_directory, action_testable_summary.test_region)
        when :by_locale
          locale = [action_testable_summary.test_language, action_testable_summary.test_region].compact.join('_')
          locale = 'UNKOWN' if locale.empty?
          output_directory = File.join(output_directory, locale)
        when :by_os_version
          output_directory = File.join(output_directory, target_device_record.operating_system_version)
        when :by_test_name
          output_directory = File.join(output_directory, action_test_plan_summary.name)
        end
      end

      output_directory
    end
  end
end
