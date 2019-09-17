# frozen_string_literal: true

require 'shellwords'
require 'json'

module XCResult
  class Parser
    attr_accessor :path, :result_bundle_json, :actions_invocation_record

    def initialize(path: nil)
      @path = Shellwords.escape(path)

      result_bundle_json_raw = get_result_bundle_json
      @result_bundle_json = JSON.parse(result_bundle_json_raw)

      @actions_invocation_record = XCResult::ActionsInvocationRecord.new(@result_bundle_json)
    end

    def action_test_plan_summaries
      return @action_test_plan_summaries if @action_test_plan_summaries

      # Parses JSON into ActionsInvocationRecord to find a list of all ids for ActionTestPlanRunSummaries
      test_refs = actions_invocation_record.actions.map do |action|
        action.action_result.tests_ref
      end.compact
      ids = test_refs.map(&:id)

      # Maps ids into ActionTestPlanRunSummaries by executing xcresulttool to get JSON
      # containing specific information for each test summary
      @action_test_plan_summaries = ids.map do |id|
        raw = execute_cmd("xcrun xcresulttool get --format json --path #{path} --id #{id}")
        json = JSON.parse(raw)
        XCResult::ActionTestPlanRunSummaries.new(json)
      end

      @action_test_plan_summaries
    end

    def export_xccovreports(destination: nil)
      destination ||= Dir.pwd

      coverages = actions_invocation_record.actions.map do |action|
        action.action_result.coverage.report_ref
      end.compact
      ids = coverages.map(&:id)

      ids.each_with_index.map do |id, i|
        output_path = File.join(destination, "action_#{i}.xccovreport")
        cmd = "xcrun xcresulttool export --path #{path} --id '#{id}' --output-path #{output_path} --type file"
        execute_cmd(cmd)

        output_path
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
