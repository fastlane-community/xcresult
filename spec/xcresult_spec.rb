# frozen_string_literal: true

RSpec.describe XCResult do
  let(:path) { File.absolute_path("./spec/fixtures/Test.xcresult") }
  let(:summary_id) { "0~2LVFAe2LWJ7FCnOsKan5UgGk7WChVJYuZlxPILKyxdpmfjsMrwjBJ2wUhaJQJ36Per_GRUfTI1cKeO2QiGvB8Q==" }

  it 'has a version number' do
    expect(XCResult::VERSION).not_to be nil
  end

  it 'parse xccov report paths' do
    require 'tmpdir'
    destination = Dir.mktmpdir

    parser = XCResult::Parser.new(path: path)
    export_xccovreport_paths = parser.export_xccovreports(destination: destination)

    expect(export_xccovreport_paths.count).to eq(1)  
  end

  it 'parse test plan summaries' do
    parser = XCResult::Parser.new(path: path)

    expect(parser).to receive(:execute_cmd).with("xcrun xcresulttool get --format json --path #{path} --id #{summary_id}").and_call_original

    summaries = parser.action_test_plan_summaries

    testable_summary = summaries[0].summaries[0].testable_summaries[0]

    expect(summaries.count).to eq(1)
    expect(summaries[0].summaries.count).to eq(1)
    expect(summaries[0].summaries[0].name).to eq("Test Scheme Action")

    expect(testable_summary.tests.count).to eq(1)
    expect(testable_summary.tests[0].duration).to eq(9.394425988197327)
    expect(testable_summary.tests[0].subtests.count).to eq(1)
  end
end
