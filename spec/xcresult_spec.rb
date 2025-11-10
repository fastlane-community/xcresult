# frozen_string_literal: true

RSpec.describe "XCResult Version" do
  let(:path) { File.absolute_path("./spec/fixtures/Test.xcresult") }
  let(:summary_id) { "0~2LVFAe2LWJ7FCnOsKan5UgGk7WChVJYuZlxPILKyxdpmfjsMrwjBJ2wUhaJQJ36Per_GRUfTI1cKeO2QiGvB8Q==" }
  let!(:subject) { XCResult::Parser.new(path: path) }
  let(:command) { subject.send(:xcresulttool_command, "get", "--format json --path #{path} --id #{summary_id}") }

  before do
    allow(subject).to receive(:`).with('xcrun xcresulttool version').and_return(xcresulttool_version)
  end

  context 'with below 23_021.0 ' do
    let(:xcresulttool_version) { 'xcresulttool version 23020, format version 3.53 (current)' }
    let(:expected) { "xcrun xcresulttool get --format json --path #{path} --id #{summary_id}" }

    it 'should not have --legacy' do
      expect(command).to eq(expected)
    end
  end

  context 'with 23_021.0 and above' do
    let(:xcresulttool_version) { 'xcresulttool version 23022, format version 3.53 (current)' }
    let(:expected) { "xcrun xcresulttool get --legacy --format json --path #{path} --id #{summary_id}" }

    it 'should have --legacy' do
      expect(command).to eq(expected)
    end
  end

  context 'with Xcode 26 command line tools version style' do
    let(:xcresulttool_version) { 'xcresulttool version 24051.1, schema version: 0.1.0 (legacy commands format version: 3.53)' }
    let(:expected) { "xcrun xcresulttool get --legacy --format json --path #{path} --id #{summary_id}" }

    it 'should have --legacy' do
      expect(command).to eq(expected)
    end
  end

  context 'with Xcode 26 command line tools version style - non-legacy version' do
    let(:xcresulttool_version) { 'xcresulttool version 23020.0, schema version: 0.1.0 (legacy commands format version: 3.53)' }
    let(:expected) { "xcrun xcresulttool get --format json --path #{path} --id #{summary_id}" }

    it 'should not have --legacy' do
      expect(command).to eq(expected)
    end
  end

  context 'with unsupported command line tools version' do
    let(:xcresulttool_version) { 'no version here' }
    let(:expected) { "xcrun xcresulttool get --legacy --format json --path #{path} --id #{summary_id}" }

    it 'should have --legacy' do
      expect(command).to eq(expected)
    end
  end
end

RSpec.describe "XCResult Test Summaries" do
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

    expect(parser).to receive(:execute_cmd).with(lambda { |command|
      is_valid_xcresulttool_command_regex = /^xcrun xcresulttool get( --legacy)? --format json --path .+ --id [a-zA-Z0-9_\~\=]+$/
      is_valid_xcresulttool_command_regex.match(command) != nil
     }).and_call_original

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
