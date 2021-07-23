# frozen_string_literal: true

require 'shellwords'
require 'json'
require 'fileutils'

require_relative 'export_options'

module XCResult
  class Parser
    attr_accessor :path, :result_bundle_json, :actions_invocation_record

    def initialize(path: nil)
      @path = Shellwords.escape(path)

      result_bundle_json_raw = get_result_bundle_json
      @result_bundle_json = JSON.parse(result_bundle_json_raw)

      @actions_invocation_record = XCResult::Models::ActionsInvocationRecord.new(@result_bundle_json)
    end

    def action_test_plan_summaries
      return @action_test_plan_summaries if @action_test_plan_summaries

      # Parses JSON into ActionsInvocationRecord to find a list of all ids for ActionTestPlanRunSummaries
      test_refs = actions_invocation_record.actions.map do |action|
        action.action_result.tests_ref
      end.compact

      # Maps ids into ActionTestPlanRunSummaries by executing xcresulttool to get JSON
      # containing specific information for each test summary
      @action_test_plan_summaries = test_refs.map { |ref| ref.load_object(from: path) }
      @action_test_plan_summaries
    end

    def export_xccovreports(destination: nil)
      destination ||= Dir.pwd

      # Collects report references
      report_refs = actions_invocation_record.actions.map do |action|
        action.action_result.coverage.report_ref
      end.compact
      ids = report_refs.map(&:id)

      # Exports all xccovreport files from the report references
      ids.each_with_index.map do |id, i|
        output_path = File.join(destination, "action_#{i}.xccovreport")
        cmd = "xcrun xcresulttool export --path #{path} --id '#{id}' --output-path #{output_path} --type file"
        execute_cmd(cmd)

        output_path
      end
    end

    def export_xccovarchives(destination: nil)
      destination ||= Dir.pwd

      # Collects archive references
      archive_refs = actions_invocation_record.actions.map do |action|
        action.action_result.coverage.archive_ref
      end.compact
      ids = archive_refs.map(&:id)

      # Exports all xcovarchive directories from the archive references
      ids.each_with_index.map do |id, i|
        output_path = File.join(destination, "action_#{i}.xccovarchive")
        cmd = "xcrun xcresulttool export --path #{path} --id '#{id}' --output-path #{output_path} --type directory"
        execute_cmd(cmd)

        output_path
      end
    end

    def export_screenshots(options = XCResult::ExportOptions.new(destination: Dir.pwd))
      # Filter non test results; i.e build action
      actions = actions_invocation_record.actions.select {|x| x.action_result.tests_ref }

      # Iterate through each action as it represents run destination (testing device)
      actions.each do |action|
        action_test_plan_run_summaries = action.action_result.tests_ref.load_object(from: path)
        action_testable_summaries = action_test_plan_run_summaries.summaries.flat_map(&:testable_summaries)

        # Iterate thorugh each action_testable_summary as it represents testing conditions such as region and language
        action_testable_summaries.each do |action_testable_summary|
          # Collect all attachments from a testing condition
          attachments = action_testable_summary.all_tests
                                               .map(&:summary_ref)
                                               .map { |ref| ref.load_object(from: path) }
                                               .flat_map(&:activity_summaries)
                                               .flat_map(&:subactivities)
                                               .flat_map(&:attachments)

          # Prepare output directory for each tests
          output_directory = options.output_directory(
            target_device_record: action.run_destination.target_device_record,
            action_testable_summary: action_testable_summary
          )
          FileUtils.mkdir_p(output_directory) unless Dir.exist?(output_directory)

          # Finally exports attachments
          attachments.each do |attachment|
            output_path = File.join(output_directory, attachment.filename)
            cmd = "xcrun xcresulttool export --path #{path} --id '#{attachment.payload_ref.id}' --output-path '#{output_path}' --type file"
            execute_cmd(cmd)
          end
        end
      end
    end

    private

    def get_result_bundle_json(id: nil)
      cmd = "xcrun xcresulttool get --format json --path #{path}"
      cmd += " --id #{id}" if id
      execute_cmd(cmd)
    end

    def execute_cmd(cmd)
      output = `#{cmd}`
      raise "Failed to execute - #{cmd}" unless $?.success?

      output
    end
  end
end
