# This is a generated file. Don't modify this directly!
# Last generated at: 2021-11-24 04:47:30 UTC
#
# Name: Xcode Result Types
# Version: 3.34
# Signature: GSHghHjCrb8=
require 'time'

module XCResult
  module Models

    class ActionAbstractTestSummary
      # @return [String, nil] name
      attr_reader :name
    
      def initialize(data)
        @name = data.dig('name', '_value') if data['name']
      end
    end

    class ActionDeviceRecord
      # @return [String] name
      attr_reader :name
      # @return [Bool] is_concrete_device
      attr_reader :is_concrete_device
      # @return [String] operating_system_version
      attr_reader :operating_system_version
      # @return [String] operating_system_version_with_build_number
      attr_reader :operating_system_version_with_build_number
      # @return [String] native_architecture
      attr_reader :native_architecture
      # @return [String] model_name
      attr_reader :model_name
      # @return [String] model_code
      attr_reader :model_code
      # @return [String] model_uti
      attr_reader :model_uti
      # @return [String] identifier
      attr_reader :identifier
      # @return [Bool] is_wireless
      attr_reader :is_wireless
      # @return [String] cpu_kind
      attr_reader :cpu_kind
      # @return [Int, nil] cpu_count
      attr_reader :cpu_count
      # @return [Int, nil] cpu_speed_in_mhz
      attr_reader :cpu_speed_in_mhz
      # @return [Int, nil] bus_speed_in_mhz
      attr_reader :bus_speed_in_mhz
      # @return [Int, nil] ram_size_in_megabytes
      attr_reader :ram_size_in_megabytes
      # @return [Int, nil] physical_cpu_cores_per_package
      attr_reader :physical_cpu_cores_per_package
      # @return [Int, nil] logical_cpu_cores_per_package
      attr_reader :logical_cpu_cores_per_package
      # @return [ActionPlatformRecord] platform_record
      attr_reader :platform_record
    
      def initialize(data)
        @name = data.dig('name', '_value')
        @is_concrete_device = data.dig('isConcreteDevice', '_value')
        @operating_system_version = data.dig('operatingSystemVersion', '_value')
        @operating_system_version_with_build_number = data.dig('operatingSystemVersionWithBuildNumber', '_value')
        @native_architecture = data.dig('nativeArchitecture', '_value')
        @model_name = data.dig('modelName', '_value')
        @model_code = data.dig('modelCode', '_value')
        @model_uti = data.dig('modelUTI', '_value')
        @identifier = data.dig('identifier', '_value')
        @is_wireless = data.dig('isWireless', '_value')
        @cpu_kind = data.dig('cpuKind', '_value')
        @cpu_count = data.dig('cpuCount', '_value') if data['cpuCount']
        @cpu_speed_in_mhz = data.dig('cpuSpeedInMHz', '_value') if data['cpuSpeedInMHz']
        @bus_speed_in_mhz = data.dig('busSpeedInMHz', '_value') if data['busSpeedInMHz']
        @ram_size_in_megabytes = data.dig('ramSizeInMegabytes', '_value') if data['ramSizeInMegabytes']
        @physical_cpu_cores_per_package = data.dig('physicalCPUCoresPerPackage', '_value') if data['physicalCPUCoresPerPackage']
        @logical_cpu_cores_per_package = data.dig('logicalCPUCoresPerPackage', '_value') if data['logicalCPUCoresPerPackage']
        @platform_record = Models.load_class(data.dig('platformRecord', '_type', '_name')).new(data.dig('platformRecord'))
      end
    end

    class ActionPlatformRecord
      # @return [String] identifier
      attr_reader :identifier
      # @return [String] user_description
      attr_reader :user_description
    
      def initialize(data)
        @identifier = data.dig('identifier', '_value')
        @user_description = data.dig('userDescription', '_value')
      end
    end

    class ActionRecord
      # @return [String] scheme_command_name
      attr_reader :scheme_command_name
      # @return [String] scheme_task_name
      attr_reader :scheme_task_name
      # @return [String, nil] title
      attr_reader :title
      # @return [Date] started_time
      attr_reader :started_time
      # @return [Date] ended_time
      attr_reader :ended_time
      # @return [ActionRunDestinationRecord] run_destination
      attr_reader :run_destination
      # @return [ActionResult] build_result
      attr_reader :build_result
      # @return [ActionResult] action_result
      attr_reader :action_result
    
      def initialize(data)
        @scheme_command_name = data.dig('schemeCommandName', '_value')
        @scheme_task_name = data.dig('schemeTaskName', '_value')
        @title = data.dig('title', '_value') if data['title']
        @started_time = data.dig('startedTime', '_value')
        @ended_time = data.dig('endedTime', '_value')
        @run_destination = Models.load_class(data.dig('runDestination', '_type', '_name')).new(data.dig('runDestination'))
        @build_result = Models.load_class(data.dig('buildResult', '_type', '_name')).new(data.dig('buildResult'))
        @action_result = Models.load_class(data.dig('actionResult', '_type', '_name')).new(data.dig('actionResult'))
      end
    end

    class ActionResult
      # @return [String] result_name
      attr_reader :result_name
      # @return [String] status
      attr_reader :status
      # @return [ResultMetrics] metrics
      attr_reader :metrics
      # @return [ResultIssueSummaries] issues
      attr_reader :issues
      # @return [CodeCoverageInfo] coverage
      attr_reader :coverage
      # @return [Reference, nil] timeline_ref
      attr_reader :timeline_ref
      # @return [Reference, nil] log_ref
      attr_reader :log_ref
      # @return [Reference, nil] tests_ref
      attr_reader :tests_ref
      # @return [Reference, nil] diagnostics_ref
      attr_reader :diagnostics_ref
    
      def initialize(data)
        @result_name = data.dig('resultName', '_value')
        @status = data.dig('status', '_value')
        @metrics = Models.load_class(data.dig('metrics', '_type', '_name')).new(data.dig('metrics'))
        @issues = Models.load_class(data.dig('issues', '_type', '_name')).new(data.dig('issues'))
        @coverage = Models.load_class(data.dig('coverage', '_type', '_name')).new(data.dig('coverage'))
        @timeline_ref = Models.load_class(data.dig('timelineRef', '_type', '_name')).new(data.dig('timelineRef')) if data['timelineRef']
        @log_ref = Models.load_class(data.dig('logRef', '_type', '_name')).new(data.dig('logRef')) if data['logRef']
        @tests_ref = Models.load_class(data.dig('testsRef', '_type', '_name')).new(data.dig('testsRef')) if data['testsRef']
        @diagnostics_ref = Models.load_class(data.dig('diagnosticsRef', '_type', '_name')).new(data.dig('diagnosticsRef')) if data['diagnosticsRef']
      end
    end

    class ActionRunDestinationRecord
      # @return [String] display_name
      attr_reader :display_name
      # @return [String] target_architecture
      attr_reader :target_architecture
      # @return [ActionDeviceRecord] target_device_record
      attr_reader :target_device_record
      # @return [ActionDeviceRecord] local_computer_record
      attr_reader :local_computer_record
      # @return [ActionSDKRecord] target_sdk_record
      attr_reader :target_sdk_record
    
      def initialize(data)
        @display_name = data.dig('displayName', '_value')
        @target_architecture = data.dig('targetArchitecture', '_value')
        @target_device_record = Models.load_class(data.dig('targetDeviceRecord', '_type', '_name')).new(data.dig('targetDeviceRecord'))
        @local_computer_record = Models.load_class(data.dig('localComputerRecord', '_type', '_name')).new(data.dig('localComputerRecord'))
        @target_sdk_record = Models.load_class(data.dig('targetSDKRecord', '_type', '_name')).new(data.dig('targetSDKRecord'))
      end
    end

    class ActionSDKRecord
      # @return [String] name
      attr_reader :name
      # @return [String] identifier
      attr_reader :identifier
      # @return [String] operating_system_version
      attr_reader :operating_system_version
      # @return [Bool] is_internal
      attr_reader :is_internal
    
      def initialize(data)
        @name = data.dig('name', '_value')
        @identifier = data.dig('identifier', '_value')
        @operating_system_version = data.dig('operatingSystemVersion', '_value')
        @is_internal = data.dig('isInternal', '_value')
      end
    end

    class ActionTestActivitySummary
      # @return [String] title
      attr_reader :title
      # @return [String] activity_type
      attr_reader :activity_type
      # @return [String] uuid
      attr_reader :uuid
      # @return [Date, nil] start
      attr_reader :start
      # @return [Date, nil] finish
      attr_reader :finish
      # @return [Array<ActionTestAttachment>] attachments
      attr_reader :attachments
      # @return [Array<ActionTestActivitySummary>] subactivities
      attr_reader :subactivities
      # @return [Array<String>] failure_summary_ids
      attr_reader :failure_summary_ids
      # @return [Array<String>] expected_failure_ids
      attr_reader :expected_failure_ids
    
      def initialize(data)
        @title = data.dig('title', '_value')
        @activity_type = data.dig('activityType', '_value')
        @uuid = data.dig('uuid', '_value')
        @start = data.dig('start', '_value') if data['start']
        @finish = data.dig('finish', '_value') if data['finish']
        @attachments = (data.dig('attachments', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
        @subactivities = (data.dig('subactivities', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
        @failure_summary_ids = (data.dig('failureSummaryIDs', '_values') || []).map {|d| d.dig('failureSummaryIDs', '_value') }
        @expected_failure_ids = (data.dig('expectedFailureIDs', '_values') || []).map {|d| d.dig('expectedFailureIDs', '_value') }
      end
    end

    class ActionTestAttachment
      # @return [String] uniform_type_identifier
      attr_reader :uniform_type_identifier
      # @return [String, nil] name
      attr_reader :name
      # @return [String, nil] uuid
      attr_reader :uuid
      # @return [Date, nil] timestamp
      attr_reader :timestamp
      # @return [SortedKeyValueArray, nil] user_info
      attr_reader :user_info
      # @return [String] lifetime
      attr_reader :lifetime
      # @return [Int] in_activity_identifier
      attr_reader :in_activity_identifier
      # @return [String, nil] filename
      attr_reader :filename
      # @return [Reference, nil] payload_ref
      attr_reader :payload_ref
      # @return [Int] payload_size
      attr_reader :payload_size
    
      def initialize(data)
        @uniform_type_identifier = data.dig('uniformTypeIdentifier', '_value')
        @name = data.dig('name', '_value') if data['name']
        @uuid = data.dig('uuid', '_value') if data['uuid']
        @timestamp = data.dig('timestamp', '_value') if data['timestamp']
        @user_info = Models.load_class(data.dig('userInfo', '_type', '_name')).new(data.dig('userInfo')) if data['userInfo']
        @lifetime = data.dig('lifetime', '_value')
        @in_activity_identifier = data.dig('inActivityIdentifier', '_value')
        @filename = data.dig('filename', '_value') if data['filename']
        @payload_ref = Models.load_class(data.dig('payloadRef', '_type', '_name')).new(data.dig('payloadRef')) if data['payloadRef']
        @payload_size = data.dig('payloadSize', '_value')
      end
    end

    class ActionTestConfiguration
      # @return [SortedKeyValueArray] values
      attr_reader :values
    
      def initialize(data)
        @values = Models.load_class(data.dig('values', '_type', '_name')).new(data.dig('values'))
      end
    end

    class ActionTestExpectedFailure
      # @return [String] uuid
      attr_reader :uuid
      # @return [String, nil] failure_reason
      attr_reader :failure_reason
      # @return [ActionTestFailureSummary, nil] failure_summary
      attr_reader :failure_summary
      # @return [Bool] is_top_level_failure
      attr_reader :is_top_level_failure
    
      def initialize(data)
        @uuid = data.dig('uuid', '_value')
        @failure_reason = data.dig('failureReason', '_value') if data['failureReason']
        @failure_summary = Models.load_class(data.dig('failureSummary', '_type', '_name')).new(data.dig('failureSummary')) if data['failureSummary']
        @is_top_level_failure = data.dig('isTopLevelFailure', '_value')
      end
    end

    class ActionTestFailureSummary
      # @return [String, nil] message
      attr_reader :message
      # @return [String] file_name
      attr_reader :file_name
      # @return [Int] line_number
      attr_reader :line_number
      # @return [Bool] is_performance_failure
      attr_reader :is_performance_failure
      # @return [String] uuid
      attr_reader :uuid
      # @return [String, nil] issue_type
      attr_reader :issue_type
      # @return [String, nil] detailed_description
      attr_reader :detailed_description
      # @return [Array<ActionTestAttachment>] attachments
      attr_reader :attachments
      # @return [TestAssociatedError, nil] associated_error
      attr_reader :associated_error
      # @return [SourceCodeContext, nil] source_code_context
      attr_reader :source_code_context
      # @return [Date, nil] timestamp
      attr_reader :timestamp
      # @return [Bool] is_top_level_failure
      attr_reader :is_top_level_failure
    
      def initialize(data)
        @message = data.dig('message', '_value') if data['message']
        @file_name = data.dig('fileName', '_value')
        @line_number = data.dig('lineNumber', '_value')
        @is_performance_failure = data.dig('isPerformanceFailure', '_value')
        @uuid = data.dig('uuid', '_value')
        @issue_type = data.dig('issueType', '_value') if data['issueType']
        @detailed_description = data.dig('detailedDescription', '_value') if data['detailedDescription']
        @attachments = (data.dig('attachments', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
        @associated_error = Models.load_class(data.dig('associatedError', '_type', '_name')).new(data.dig('associatedError')) if data['associatedError']
        @source_code_context = Models.load_class(data.dig('sourceCodeContext', '_type', '_name')).new(data.dig('sourceCodeContext')) if data['sourceCodeContext']
        @timestamp = data.dig('timestamp', '_value') if data['timestamp']
        @is_top_level_failure = data.dig('isTopLevelFailure', '_value')
      end
    end

    class ActionTestSummaryIdentifiableObject < ActionAbstractTestSummary
      # @return [String, nil] identifier
      attr_reader :identifier
    
      def initialize(data)
        @identifier = data.dig('identifier', '_value') if data['identifier']
        super
      end
    end

    class ActionTestMetadata < ActionTestSummaryIdentifiableObject
      # @return [String] test_status
      attr_reader :test_status
      # @return [Double, nil] duration
      attr_reader :duration
      # @return [Reference, nil] summary_ref
      attr_reader :summary_ref
      # @return [Int] performance_metrics_count
      attr_reader :performance_metrics_count
      # @return [Int] failure_summaries_count
      attr_reader :failure_summaries_count
      # @return [Int] activity_summaries_count
      attr_reader :activity_summaries_count
    
      def initialize(data)
        @test_status = data.dig('testStatus', '_value')
        @duration = data.dig('duration', '_value') if data['duration']
        @summary_ref = Models.load_class(data.dig('summaryRef', '_type', '_name')).new(data.dig('summaryRef')) if data['summaryRef']
        @performance_metrics_count = data.dig('performanceMetricsCount', '_value')
        @failure_summaries_count = data.dig('failureSummariesCount', '_value')
        @activity_summaries_count = data.dig('activitySummariesCount', '_value')
        super
      end
    end

    class ActionTestNoticeSummary
      # @return [String, nil] message
      attr_reader :message
      # @return [String] file_name
      attr_reader :file_name
      # @return [Int] line_number
      attr_reader :line_number
    
      def initialize(data)
        @message = data.dig('message', '_value') if data['message']
        @file_name = data.dig('fileName', '_value')
        @line_number = data.dig('lineNumber', '_value')
      end
    end

    class ActionTestPerformanceMetricSummary
      # @return [String] display_name
      attr_reader :display_name
      # @return [String] unit_of_measurement
      attr_reader :unit_of_measurement
      # @return [Array<Double>] measurements
      attr_reader :measurements
      # @return [String, nil] identifier
      attr_reader :identifier
      # @return [String, nil] baseline_name
      attr_reader :baseline_name
      # @return [Double, nil] baseline_average
      attr_reader :baseline_average
      # @return [Double, nil] max_percent_regression
      attr_reader :max_percent_regression
      # @return [Double, nil] max_percent_relative_standard_deviation
      attr_reader :max_percent_relative_standard_deviation
      # @return [Double, nil] max_regression
      attr_reader :max_regression
      # @return [Double, nil] max_standard_deviation
      attr_reader :max_standard_deviation
      # @return [String, nil] polarity
      attr_reader :polarity
    
      def initialize(data)
        @display_name = data.dig('displayName', '_value')
        @unit_of_measurement = data.dig('unitOfMeasurement', '_value')
        @measurements = (data.dig('measurements', '_values') || []).map {|d| d.dig('measurements', '_value') }
        @identifier = data.dig('identifier', '_value') if data['identifier']
        @baseline_name = data.dig('baselineName', '_value') if data['baselineName']
        @baseline_average = data.dig('baselineAverage', '_value') if data['baselineAverage']
        @max_percent_regression = data.dig('maxPercentRegression', '_value') if data['maxPercentRegression']
        @max_percent_relative_standard_deviation = data.dig('maxPercentRelativeStandardDeviation', '_value') if data['maxPercentRelativeStandardDeviation']
        @max_regression = data.dig('maxRegression', '_value') if data['maxRegression']
        @max_standard_deviation = data.dig('maxStandardDeviation', '_value') if data['maxStandardDeviation']
        @polarity = data.dig('polarity', '_value') if data['polarity']
      end
    end

    class ActionTestPlanRunSummaries
      # @return [Array<ActionTestPlanRunSummary>] summaries
      attr_reader :summaries
    
      def initialize(data)
        @summaries = (data.dig('summaries', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
      end
    end

    class ActionTestPlanRunSummary < ActionAbstractTestSummary
      # @return [Array<ActionTestableSummary>] testable_summaries
      attr_reader :testable_summaries
    
      def initialize(data)
        @testable_summaries = (data.dig('testableSummaries', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
        super
      end
    end

    class ActionTestRepetitionPolicySummary
      # @return [Int, nil] iteration
      attr_reader :iteration
      # @return [Int, nil] total_iterations
      attr_reader :total_iterations
      # @return [String, nil] repetition_mode
      attr_reader :repetition_mode
    
      def initialize(data)
        @iteration = data.dig('iteration', '_value') if data['iteration']
        @total_iterations = data.dig('totalIterations', '_value') if data['totalIterations']
        @repetition_mode = data.dig('repetitionMode', '_value') if data['repetitionMode']
      end
    end

    class ActionTestSummary < ActionTestSummaryIdentifiableObject
      # @return [String] test_status
      attr_reader :test_status
      # @return [Double] duration
      attr_reader :duration
      # @return [Array<ActionTestPerformanceMetricSummary>] performance_metrics
      attr_reader :performance_metrics
      # @return [Array<ActionTestFailureSummary>] failure_summaries
      attr_reader :failure_summaries
      # @return [Array<ActionTestExpectedFailure>] expected_failures
      attr_reader :expected_failures
      # @return [ActionTestNoticeSummary, nil] skip_notice_summary
      attr_reader :skip_notice_summary
      # @return [Array<ActionTestActivitySummary>] activity_summaries
      attr_reader :activity_summaries
      # @return [ActionTestRepetitionPolicySummary, nil] repetition_policy_summary
      attr_reader :repetition_policy_summary
      # @return [ActionTestConfiguration, nil] configuration
      attr_reader :configuration
    
      def initialize(data)
        @test_status = data.dig('testStatus', '_value')
        @duration = data.dig('duration', '_value')
        @performance_metrics = (data.dig('performanceMetrics', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
        @failure_summaries = (data.dig('failureSummaries', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
        @expected_failures = (data.dig('expectedFailures', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
        @skip_notice_summary = Models.load_class(data.dig('skipNoticeSummary', '_type', '_name')).new(data.dig('skipNoticeSummary')) if data['skipNoticeSummary']
        @activity_summaries = (data.dig('activitySummaries', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
        @repetition_policy_summary = Models.load_class(data.dig('repetitionPolicySummary', '_type', '_name')).new(data.dig('repetitionPolicySummary')) if data['repetitionPolicySummary']
        @configuration = Models.load_class(data.dig('configuration', '_type', '_name')).new(data.dig('configuration')) if data['configuration']
        super
      end
    end

    class ActionTestSummaryGroup < ActionTestSummaryIdentifiableObject
      # @return [Double] duration
      attr_reader :duration
      # @return [Array<ActionTestSummaryIdentifiableObject>] subtests
      attr_reader :subtests
    
      def initialize(data)
        @duration = data.dig('duration', '_value')
        @subtests = (data.dig('subtests', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
        super
      end
    end

    class ActionTestableSummary < ActionAbstractTestSummary
      # @return [String, nil] project_relative_path
      attr_reader :project_relative_path
      # @return [String, nil] target_name
      attr_reader :target_name
      # @return [String, nil] test_kind
      attr_reader :test_kind
      # @return [Array<ActionTestSummaryIdentifiableObject>] tests
      attr_reader :tests
      # @return [String, nil] diagnostics_directory_name
      attr_reader :diagnostics_directory_name
      # @return [Array<ActionTestFailureSummary>] failure_summaries
      attr_reader :failure_summaries
      # @return [String, nil] test_language
      attr_reader :test_language
      # @return [String, nil] test_region
      attr_reader :test_region
    
      def initialize(data)
        @project_relative_path = data.dig('projectRelativePath', '_value') if data['projectRelativePath']
        @target_name = data.dig('targetName', '_value') if data['targetName']
        @test_kind = data.dig('testKind', '_value') if data['testKind']
        @tests = (data.dig('tests', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
        @diagnostics_directory_name = data.dig('diagnosticsDirectoryName', '_value') if data['diagnosticsDirectoryName']
        @failure_summaries = (data.dig('failureSummaries', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
        @test_language = data.dig('testLanguage', '_value') if data['testLanguage']
        @test_region = data.dig('testRegion', '_value') if data['testRegion']
        super
      end
    end

    class ActionsInvocationMetadata
      # @return [String] creating_workspace_file_path
      attr_reader :creating_workspace_file_path
      # @return [String] unique_identifier
      attr_reader :unique_identifier
      # @return [EntityIdentifier, nil] scheme_identifier
      attr_reader :scheme_identifier
    
      def initialize(data)
        @creating_workspace_file_path = data.dig('creatingWorkspaceFilePath', '_value')
        @unique_identifier = data.dig('uniqueIdentifier', '_value')
        @scheme_identifier = Models.load_class(data.dig('schemeIdentifier', '_type', '_name')).new(data.dig('schemeIdentifier')) if data['schemeIdentifier']
      end
    end

    class ActionsInvocationRecord
      # @return [Reference, nil] metadata_ref
      attr_reader :metadata_ref
      # @return [ResultMetrics] metrics
      attr_reader :metrics
      # @return [ResultIssueSummaries] issues
      attr_reader :issues
      # @return [Array<ActionRecord>] actions
      attr_reader :actions
      # @return [ArchiveInfo, nil] archive
      attr_reader :archive
    
      def initialize(data)
        @metadata_ref = Models.load_class(data.dig('metadataRef', '_type', '_name')).new(data.dig('metadataRef')) if data['metadataRef']
        @metrics = Models.load_class(data.dig('metrics', '_type', '_name')).new(data.dig('metrics'))
        @issues = Models.load_class(data.dig('issues', '_type', '_name')).new(data.dig('issues'))
        @actions = (data.dig('actions', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
        @archive = Models.load_class(data.dig('archive', '_type', '_name')).new(data.dig('archive')) if data['archive']
      end
    end

    class ActivityLogAnalyzerStep
      # @return [Int] parent_index
      attr_reader :parent_index
    
      def initialize(data)
        @parent_index = data.dig('parentIndex', '_value')
      end
    end

    class ActivityLogAnalyzerControlFlowStep < ActivityLogAnalyzerStep
      # @return [String] title
      attr_reader :title
      # @return [DocumentLocation, nil] start_location
      attr_reader :start_location
      # @return [DocumentLocation, nil] end_location
      attr_reader :end_location
      # @return [Array<ActivityLogAnalyzerControlFlowStepEdge>] edges
      attr_reader :edges
    
      def initialize(data)
        @title = data.dig('title', '_value')
        @start_location = Models.load_class(data.dig('startLocation', '_type', '_name')).new(data.dig('startLocation')) if data['startLocation']
        @end_location = Models.load_class(data.dig('endLocation', '_type', '_name')).new(data.dig('endLocation')) if data['endLocation']
        @edges = (data.dig('edges', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
        super
      end
    end

    class ActivityLogAnalyzerControlFlowStepEdge
      # @return [DocumentLocation, nil] start_location
      attr_reader :start_location
      # @return [DocumentLocation, nil] end_location
      attr_reader :end_location
    
      def initialize(data)
        @start_location = Models.load_class(data.dig('startLocation', '_type', '_name')).new(data.dig('startLocation')) if data['startLocation']
        @end_location = Models.load_class(data.dig('endLocation', '_type', '_name')).new(data.dig('endLocation')) if data['endLocation']
      end
    end

    class ActivityLogAnalyzerEventStep < ActivityLogAnalyzerStep
      # @return [String] title
      attr_reader :title
      # @return [DocumentLocation, nil] location
      attr_reader :location
      # @return [String] description
      attr_reader :description
      # @return [Int] call_depth
      attr_reader :call_depth
    
      def initialize(data)
        @title = data.dig('title', '_value')
        @location = Models.load_class(data.dig('location', '_type', '_name')).new(data.dig('location')) if data['location']
        @description = data.dig('description', '_value')
        @call_depth = data.dig('callDepth', '_value')
        super
      end
    end

    class ActivityLogMessage
      # @return [String] type
      attr_reader :type
      # @return [String] title
      attr_reader :title
      # @return [String, nil] short_title
      attr_reader :short_title
      # @return [String, nil] category
      attr_reader :category
      # @return [DocumentLocation, nil] location
      attr_reader :location
      # @return [Array<ActivityLogMessageAnnotation>] annotations
      attr_reader :annotations
    
      def initialize(data)
        @type = data.dig('type', '_value')
        @title = data.dig('title', '_value')
        @short_title = data.dig('shortTitle', '_value') if data['shortTitle']
        @category = data.dig('category', '_value') if data['category']
        @location = Models.load_class(data.dig('location', '_type', '_name')).new(data.dig('location')) if data['location']
        @annotations = (data.dig('annotations', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
      end
    end

    class ActivityLogAnalyzerResultMessage < ActivityLogMessage
      # @return [Array<ActivityLogAnalyzerStep>] steps
      attr_reader :steps
      # @return [String, nil] result_type
      attr_reader :result_type
      # @return [Int] key_event_index
      attr_reader :key_event_index
    
      def initialize(data)
        @steps = (data.dig('steps', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
        @result_type = data.dig('resultType', '_value') if data['resultType']
        @key_event_index = data.dig('keyEventIndex', '_value')
        super
      end
    end

    class ActivityLogAnalyzerWarningMessage < ActivityLogMessage
    
      def initialize(data)
        super
      end
    end

    class ActivityLogSection
      # @return [String] domain_type
      attr_reader :domain_type
      # @return [String] title
      attr_reader :title
      # @return [Date, nil] start_time
      attr_reader :start_time
      # @return [Double] duration
      attr_reader :duration
      # @return [String, nil] result
      attr_reader :result
      # @return [DocumentLocation, nil] location
      attr_reader :location
      # @return [Array<ActivityLogSection>] subsections
      attr_reader :subsections
      # @return [Array<ActivityLogMessage>] messages
      attr_reader :messages
    
      def initialize(data)
        @domain_type = data.dig('domainType', '_value')
        @title = data.dig('title', '_value')
        @start_time = data.dig('startTime', '_value') if data['startTime']
        @duration = data.dig('duration', '_value')
        @result = data.dig('result', '_value') if data['result']
        @location = Models.load_class(data.dig('location', '_type', '_name')).new(data.dig('location')) if data['location']
        @subsections = (data.dig('subsections', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
        @messages = (data.dig('messages', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
      end
    end

    class ActivityLogCommandInvocationSection < ActivityLogSection
      # @return [String] command_details
      attr_reader :command_details
      # @return [String] emitted_output
      attr_reader :emitted_output
      # @return [Int, nil] exit_code
      attr_reader :exit_code
    
      def initialize(data)
        @command_details = data.dig('commandDetails', '_value')
        @emitted_output = data.dig('emittedOutput', '_value')
        @exit_code = data.dig('exitCode', '_value') if data['exitCode']
        super
      end
    end

    class ActivityLogMajorSection < ActivityLogSection
      # @return [String] subtitle
      attr_reader :subtitle
    
      def initialize(data)
        @subtitle = data.dig('subtitle', '_value')
        super
      end
    end

    class ActivityLogMessageAnnotation
      # @return [String] title
      attr_reader :title
      # @return [DocumentLocation, nil] location
      attr_reader :location
    
      def initialize(data)
        @title = data.dig('title', '_value')
        @location = Models.load_class(data.dig('location', '_type', '_name')).new(data.dig('location')) if data['location']
      end
    end

    class ActivityLogTargetBuildSection < ActivityLogMajorSection
      # @return [String, nil] product_type
      attr_reader :product_type
    
      def initialize(data)
        @product_type = data.dig('productType', '_value') if data['productType']
        super
      end
    end

    class ActivityLogUnitTestSection < ActivityLogSection
      # @return [String, nil] test_name
      attr_reader :test_name
      # @return [String, nil] suite_name
      attr_reader :suite_name
      # @return [String, nil] summary
      attr_reader :summary
      # @return [String, nil] emitted_output
      attr_reader :emitted_output
      # @return [String, nil] performance_test_output
      attr_reader :performance_test_output
      # @return [String, nil] tests_passed_string
      attr_reader :tests_passed_string
      # @return [Bool] was_skipped
      attr_reader :was_skipped
      # @return [String, nil] runnable_path
      attr_reader :runnable_path
      # @return [String, nil] runnable_uti
      attr_reader :runnable_uti
    
      def initialize(data)
        @test_name = data.dig('testName', '_value') if data['testName']
        @suite_name = data.dig('suiteName', '_value') if data['suiteName']
        @summary = data.dig('summary', '_value') if data['summary']
        @emitted_output = data.dig('emittedOutput', '_value') if data['emittedOutput']
        @performance_test_output = data.dig('performanceTestOutput', '_value') if data['performanceTestOutput']
        @tests_passed_string = data.dig('testsPassedString', '_value') if data['testsPassedString']
        @was_skipped = data.dig('wasSkipped', '_value')
        @runnable_path = data.dig('runnablePath', '_value') if data['runnablePath']
        @runnable_uti = data.dig('runnableUTI', '_value') if data['runnableUTI']
        super
      end
    end

    class ArchiveInfo
      # @return [String, nil] path
      attr_reader :path
    
      def initialize(data)
        @path = data.dig('path', '_value') if data['path']
      end
    end

    class Array
    
      def initialize(data)
      end
    end

    class CodeCoverageInfo
      # @return [Bool] has_coverage_data
      attr_reader :has_coverage_data
      # @return [Reference, nil] report_ref
      attr_reader :report_ref
      # @return [Reference, nil] archive_ref
      attr_reader :archive_ref
    
      def initialize(data)
        @has_coverage_data = data.dig('hasCoverageData', '_value')
        @report_ref = Models.load_class(data.dig('reportRef', '_type', '_name')).new(data.dig('reportRef')) if data['reportRef']
        @archive_ref = Models.load_class(data.dig('archiveRef', '_type', '_name')).new(data.dig('archiveRef')) if data['archiveRef']
      end
    end

    class DocumentLocation
      # @return [String] url
      attr_reader :url
      # @return [String] concrete_type_name
      attr_reader :concrete_type_name
    
      def initialize(data)
        @url = data.dig('url', '_value')
        @concrete_type_name = data.dig('concreteTypeName', '_value')
      end
    end

    class EntityIdentifier
      # @return [String] entity_name
      attr_reader :entity_name
      # @return [String] container_name
      attr_reader :container_name
      # @return [String] entity_type
      attr_reader :entity_type
      # @return [String] shared_state
      attr_reader :shared_state
    
      def initialize(data)
        @entity_name = data.dig('entityName', '_value')
        @container_name = data.dig('containerName', '_value')
        @entity_type = data.dig('entityType', '_value')
        @shared_state = data.dig('sharedState', '_value')
      end
    end

    class IssueSummary
      # @return [String] issue_type
      attr_reader :issue_type
      # @return [String] message
      attr_reader :message
      # @return [String, nil] producing_target
      attr_reader :producing_target
      # @return [DocumentLocation, nil] document_location_in_creating_workspace
      attr_reader :document_location_in_creating_workspace
    
      def initialize(data)
        @issue_type = data.dig('issueType', '_value')
        @message = data.dig('message', '_value')
        @producing_target = data.dig('producingTarget', '_value') if data['producingTarget']
        @document_location_in_creating_workspace = Models.load_class(data.dig('documentLocationInCreatingWorkspace', '_type', '_name')).new(data.dig('documentLocationInCreatingWorkspace')) if data['documentLocationInCreatingWorkspace']
      end
    end

    class ObjectID
      # @return [String] hash
      attr_reader :hash
    
      def initialize(data)
        @hash = data.dig('hash', '_value')
      end
    end

    class Reference
      # @return [String] id
      attr_reader :id
      # @return [TypeDefinition, nil] target_type
      attr_reader :target_type
    
      def initialize(data)
        @id = data.dig('id', '_value')
        @target_type = Models.load_class(data.dig('targetType', '_type', '_name')).new(data.dig('targetType')) if data['targetType']
      end
    end

    class ResultIssueSummaries
      # @return [Array<IssueSummary>] analyzer_warning_summaries
      attr_reader :analyzer_warning_summaries
      # @return [Array<IssueSummary>] error_summaries
      attr_reader :error_summaries
      # @return [Array<TestFailureIssueSummary>] test_failure_summaries
      attr_reader :test_failure_summaries
      # @return [Array<IssueSummary>] warning_summaries
      attr_reader :warning_summaries
    
      def initialize(data)
        @analyzer_warning_summaries = (data.dig('analyzerWarningSummaries', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
        @error_summaries = (data.dig('errorSummaries', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
        @test_failure_summaries = (data.dig('testFailureSummaries', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
        @warning_summaries = (data.dig('warningSummaries', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
      end
    end

    class ResultMetrics
      # @return [Int] analyzer_warning_count
      attr_reader :analyzer_warning_count
      # @return [Int] error_count
      attr_reader :error_count
      # @return [Int] tests_count
      attr_reader :tests_count
      # @return [Int] tests_failed_count
      attr_reader :tests_failed_count
      # @return [Int] tests_skipped_count
      attr_reader :tests_skipped_count
      # @return [Int] warning_count
      attr_reader :warning_count
    
      def initialize(data)
        @analyzer_warning_count = data.dig('analyzerWarningCount', '_value')
        @error_count = data.dig('errorCount', '_value')
        @tests_count = data.dig('testsCount', '_value')
        @tests_failed_count = data.dig('testsFailedCount', '_value')
        @tests_skipped_count = data.dig('testsSkippedCount', '_value')
        @warning_count = data.dig('warningCount', '_value')
      end
    end

    class SortedKeyValueArray
      # @return [Array<SortedKeyValueArrayPair>] storage
      attr_reader :storage
    
      def initialize(data)
        @storage = (data.dig('storage', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
      end
    end

    class SortedKeyValueArrayPair
      # @return [String] key
      attr_reader :key
      # @return [SchemaSerializable] value
      attr_reader :value
    
      def initialize(data)
        @key = data.dig('key', '_value')
        @value = data.dig('value', '_value')
      end
    end

    class SourceCodeContext
      # @return [SourceCodeLocation, nil] location
      attr_reader :location
      # @return [Array<SourceCodeFrame>] call_stack
      attr_reader :call_stack
    
      def initialize(data)
        @location = Models.load_class(data.dig('location', '_type', '_name')).new(data.dig('location')) if data['location']
        @call_stack = (data.dig('callStack', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
      end
    end

    class SourceCodeFrame
      # @return [String, nil] address_string
      attr_reader :address_string
      # @return [SourceCodeSymbolInfo, nil] symbol_info
      attr_reader :symbol_info
    
      def initialize(data)
        @address_string = data.dig('addressString', '_value') if data['addressString']
        @symbol_info = Models.load_class(data.dig('symbolInfo', '_type', '_name')).new(data.dig('symbolInfo')) if data['symbolInfo']
      end
    end

    class SourceCodeLocation
      # @return [String, nil] file_path
      attr_reader :file_path
      # @return [Int, nil] line_number
      attr_reader :line_number
    
      def initialize(data)
        @file_path = data.dig('filePath', '_value') if data['filePath']
        @line_number = data.dig('lineNumber', '_value') if data['lineNumber']
      end
    end

    class SourceCodeSymbolInfo
      # @return [String, nil] image_name
      attr_reader :image_name
      # @return [String, nil] symbol_name
      attr_reader :symbol_name
      # @return [SourceCodeLocation, nil] location
      attr_reader :location
    
      def initialize(data)
        @image_name = data.dig('imageName', '_value') if data['imageName']
        @symbol_name = data.dig('symbolName', '_value') if data['symbolName']
        @location = Models.load_class(data.dig('location', '_type', '_name')).new(data.dig('location')) if data['location']
      end
    end

    class TestAssociatedError
      # @return [String, nil] domain
      attr_reader :domain
      # @return [Int, nil] code
      attr_reader :code
      # @return [SortedKeyValueArray, nil] user_info
      attr_reader :user_info
    
      def initialize(data)
        @domain = data.dig('domain', '_value') if data['domain']
        @code = data.dig('code', '_value') if data['code']
        @user_info = Models.load_class(data.dig('userInfo', '_type', '_name')).new(data.dig('userInfo')) if data['userInfo']
      end
    end

    class TestFailureIssueSummary < IssueSummary
      # @return [String] test_case_name
      attr_reader :test_case_name
    
      def initialize(data)
        @test_case_name = data.dig('testCaseName', '_value')
        super
      end
    end

    class TypeDefinition
      # @return [String] name
      attr_reader :name
      # @return [TypeDefinition, nil] supertype
      attr_reader :supertype
    
      def initialize(data)
        @name = data.dig('name', '_value')
        @supertype = Models.load_class(data.dig('supertype', '_type', '_name')).new(data.dig('supertype')) if data['supertype']
      end
    end

  end
end
