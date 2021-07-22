# This is a generated file. Don't modify this directly!
# Last generated at: 2021-07-22 07:27:14 UTC
#
# Name: Xcode Result Types
# Version: 3.30
# Signature: Vu9Uty9iL1U=
require 'time'

module XCResult
  module Models

    def self.load_class(class_name)
      Kernel.const_get("XCResult::Models::#{class_name}")
    end

    # - ActionAbstractTestSummary
    #   * Kind: object
    #   * Properties:
    #     + name: String?
    class ActionAbstractTestSummary
      # @return [String, nil] name
      attr_reader :name
    
      def initialize(data)
        @name = data.dig('name', '_value') if data['name']
      end
    end

    # - ActionDeviceRecord
    #   * Kind: object
    #   * Properties:
    #     + name: String
    #     + isConcreteDevice: Bool
    #     + operatingSystemVersion: String
    #     + operatingSystemVersionWithBuildNumber: String
    #     + nativeArchitecture: String
    #     + modelName: String
    #     + modelCode: String
    #     + modelUTI: String
    #     + identifier: String
    #     + isWireless: Bool
    #     + cpuKind: String
    #     + cpuCount: Int?
    #     + cpuSpeedInMHz: Int?
    #     + busSpeedInMHz: Int?
    #     + ramSizeInMegabytes: Int?
    #     + physicalCPUCoresPerPackage: Int?
    #     + logicalCPUCoresPerPackage: Int?
    #     + platformRecord: ActionPlatformRecord
    class ActionDeviceRecord
      # @return [String] name
      attr_reader :name
      # @return [Bool] isConcreteDevice
      attr_reader :is_concrete_device
      # @return [String] operatingSystemVersion
      attr_reader :operating_system_version
      # @return [String] operatingSystemVersionWithBuildNumber
      attr_reader :operating_system_version_with_build_number
      # @return [String] nativeArchitecture
      attr_reader :native_architecture
      # @return [String] modelName
      attr_reader :model_name
      # @return [String] modelCode
      attr_reader :model_code
      # @return [String] modelUTI
      attr_reader :model_uti
      # @return [String] identifier
      attr_reader :identifier
      # @return [Bool] isWireless
      attr_reader :is_wireless
      # @return [String] cpuKind
      attr_reader :cpu_kind
      # @return [Int, nil] cpuCount
      attr_reader :cpu_count
      # @return [Int, nil] cpuSpeedInMHz
      attr_reader :cpu_speed_in_mhz
      # @return [Int, nil] busSpeedInMHz
      attr_reader :bus_speed_in_mhz
      # @return [Int, nil] ramSizeInMegabytes
      attr_reader :ram_size_in_megabytes
      # @return [Int, nil] physicalCPUCoresPerPackage
      attr_reader :physical_cpu_cores_per_package
      # @return [Int, nil] logicalCPUCoresPerPackage
      attr_reader :logical_cpu_cores_per_package
      # @return [ActionPlatformRecord] platformRecord
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
        @cpu_count = data.dig('cpuCount', '_value').to_i if data['cpuCount']
        @cpu_speed_in_mhz = data.dig('cpuSpeedInMHz', '_value').to_i if data['cpuSpeedInMHz']
        @bus_speed_in_mhz = data.dig('busSpeedInMHz', '_value').to_i if data['busSpeedInMHz']
        @ram_size_in_megabytes = data.dig('ramSizeInMegabytes', '_value').to_i if data['ramSizeInMegabytes']
        @physical_cpu_cores_per_package = data.dig('physicalCPUCoresPerPackage', '_value').to_i if data['physicalCPUCoresPerPackage']
        @logical_cpu_cores_per_package = data.dig('logicalCPUCoresPerPackage', '_value').to_i if data['logicalCPUCoresPerPackage']
        @platform_record = Models.load_class(data.dig('platformRecord', '_type', '_name')).new(data.dig('platformRecord'))
      end
    end

    # - ActionPlatformRecord
    #   * Kind: object
    #   * Properties:
    #     + identifier: String
    #     + userDescription: String
    class ActionPlatformRecord
      # @return [String] identifier
      attr_reader :identifier
      # @return [String] userDescription
      attr_reader :user_description
    
      def initialize(data)
        @identifier = data.dig('identifier', '_value')
        @user_description = data.dig('userDescription', '_value')
      end
    end

    # - ActionRecord
    #   * Kind: object
    #   * Properties:
    #     + schemeCommandName: String
    #     + schemeTaskName: String
    #     + title: String?
    #     + startedTime: Date
    #     + endedTime: Date
    #     + runDestination: ActionRunDestinationRecord
    #     + buildResult: ActionResult
    #     + actionResult: ActionResult
    class ActionRecord
      # @return [String] schemeCommandName
      attr_reader :scheme_command_name
      # @return [String] schemeTaskName
      attr_reader :scheme_task_name
      # @return [String, nil] title
      attr_reader :title
      # @return [Date] startedTime
      attr_reader :started_time
      # @return [Date] endedTime
      attr_reader :ended_time
      # @return [ActionRunDestinationRecord] runDestination
      attr_reader :run_destination
      # @return [ActionResult] buildResult
      attr_reader :build_result
      # @return [ActionResult] actionResult
      attr_reader :action_result
    
      def initialize(data)
        @scheme_command_name = data.dig('schemeCommandName', '_value')
        @scheme_task_name = data.dig('schemeTaskName', '_value')
        @title = data.dig('title', '_value') if data['title']
        @started_time = Time.parse(data.dig('startedTime', '_value'))
        @ended_time = Time.parse(data.dig('endedTime', '_value'))
        @run_destination = Models.load_class(data.dig('runDestination', '_type', '_name')).new(data.dig('runDestination'))
        @build_result = Models.load_class(data.dig('buildResult', '_type', '_name')).new(data.dig('buildResult'))
        @action_result = Models.load_class(data.dig('actionResult', '_type', '_name')).new(data.dig('actionResult'))
      end
    end

    # - ActionResult
    #   * Kind: object
    #   * Properties:
    #     + resultName: String
    #     + status: String
    #     + metrics: ResultMetrics
    #     + issues: ResultIssueSummaries
    #     + coverage: CodeCoverageInfo
    #     + timelineRef: Reference?
    #     + logRef: Reference?
    #     + testsRef: Reference?
    #     + diagnosticsRef: Reference?
    class ActionResult
      # @return [String] resultName
      attr_reader :result_name
      # @return [String] status
      attr_reader :status
      # @return [ResultMetrics] metrics
      attr_reader :metrics
      # @return [ResultIssueSummaries] issues
      attr_reader :issues
      # @return [CodeCoverageInfo] coverage
      attr_reader :coverage
      # @return [Reference, nil] timelineRef
      attr_reader :timeline_ref
      # @return [Reference, nil] logRef
      attr_reader :log_ref
      # @return [Reference, nil] testsRef
      attr_reader :tests_ref
      # @return [Reference, nil] diagnosticsRef
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

    # - ActionRunDestinationRecord
    #   * Kind: object
    #   * Properties:
    #     + displayName: String
    #     + targetArchitecture: String
    #     + targetDeviceRecord: ActionDeviceRecord
    #     + localComputerRecord: ActionDeviceRecord
    #     + targetSDKRecord: ActionSDKRecord
    class ActionRunDestinationRecord
      # @return [String] displayName
      attr_reader :display_name
      # @return [String] targetArchitecture
      attr_reader :target_architecture
      # @return [ActionDeviceRecord] targetDeviceRecord
      attr_reader :target_device_record
      # @return [ActionDeviceRecord] localComputerRecord
      attr_reader :local_computer_record
      # @return [ActionSDKRecord] targetSDKRecord
      attr_reader :target_sdk_record
    
      def initialize(data)
        @display_name = data.dig('displayName', '_value')
        @target_architecture = data.dig('targetArchitecture', '_value')
        @target_device_record = Models.load_class(data.dig('targetDeviceRecord', '_type', '_name')).new(data.dig('targetDeviceRecord'))
        @local_computer_record = Models.load_class(data.dig('localComputerRecord', '_type', '_name')).new(data.dig('localComputerRecord'))
        @target_sdk_record = Models.load_class(data.dig('targetSDKRecord', '_type', '_name')).new(data.dig('targetSDKRecord'))
      end
    end

    # - ActionSDKRecord
    #   * Kind: object
    #   * Properties:
    #     + name: String
    #     + identifier: String
    #     + operatingSystemVersion: String
    #     + isInternal: Bool
    class ActionSDKRecord
      # @return [String] name
      attr_reader :name
      # @return [String] identifier
      attr_reader :identifier
      # @return [String] operatingSystemVersion
      attr_reader :operating_system_version
      # @return [Bool] isInternal
      attr_reader :is_internal
    
      def initialize(data)
        @name = data.dig('name', '_value')
        @identifier = data.dig('identifier', '_value')
        @operating_system_version = data.dig('operatingSystemVersion', '_value')
        @is_internal = data.dig('isInternal', '_value')
      end
    end

    # - ActionTestActivitySummary
    #   * Kind: object
    #   * Properties:
    #     + title: String
    #     + activityType: String
    #     + uuid: String
    #     + start: Date?
    #     + finish: Date?
    #     + attachments: [ActionTestAttachment]
    #     + subactivities: [ActionTestActivitySummary]
    #     + failureSummaryIDs: [String]
    #     + expectedFailureIDs: [String]
    class ActionTestActivitySummary
      # @return [String] title
      attr_reader :title
      # @return [String] activityType
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
      # @return [Array<String>] failureSummaryIDs
      attr_reader :failure_summary_ids
      # @return [Array<String>] expectedFailureIDs
      attr_reader :expected_failure_ids
    
      def initialize(data)
        @title = data.dig('title', '_value')
        @activity_type = data.dig('activityType', '_value')
        @uuid = data.dig('uuid', '_value')
        @start = Time.parse(data.dig('start', '_value')) if data['start']
        @finish = Time.parse(data.dig('finish', '_value')) if data['finish']
        @attachments = (data.dig('attachments', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
        @subactivities = (data.dig('subactivities', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
        @failure_summary_ids = (data.dig('failureSummaryIDs', '_values') || []).map {|d| d.dig('failureSummaryIDs', '_value') }
        @expected_failure_ids = (data.dig('expectedFailureIDs', '_values') || []).map {|d| d.dig('expectedFailureIDs', '_value') }
      end
    end

    # - ActionTestAttachment
    #   * Kind: object
    #   * Properties:
    #     + uniformTypeIdentifier: String
    #     + name: String?
    #     + timestamp: Date?
    #     + userInfo: SortedKeyValueArray?
    #     + lifetime: String
    #     + inActivityIdentifier: Int
    #     + filename: String?
    #     + payloadRef: Reference?
    #     + payloadSize: Int
    class ActionTestAttachment
      # @return [String] uniformTypeIdentifier
      attr_reader :uniform_type_identifier
      # @return [String, nil] name
      attr_reader :name
      # @return [Date, nil] timestamp
      attr_reader :timestamp
      # @return [SortedKeyValueArray, nil] userInfo
      attr_reader :user_info
      # @return [String] lifetime
      attr_reader :lifetime
      # @return [Int] inActivityIdentifier
      attr_reader :in_activity_identifier
      # @return [String, nil] filename
      attr_reader :filename
      # @return [Reference, nil] payloadRef
      attr_reader :payload_ref
      # @return [Int] payloadSize
      attr_reader :payload_size
    
      def initialize(data)
        @uniform_type_identifier = data.dig('uniformTypeIdentifier', '_value')
        @name = data.dig('name', '_value') if data['name']
        @timestamp = Time.parse(data.dig('timestamp', '_value')) if data['timestamp']
        @user_info = Models.load_class(data.dig('userInfo', '_type', '_name')).new(data.dig('userInfo')) if data['userInfo']
        @lifetime = data.dig('lifetime', '_value')
        @in_activity_identifier = data.dig('inActivityIdentifier', '_value').to_i
        @filename = data.dig('filename', '_value') if data['filename']
        @payload_ref = Models.load_class(data.dig('payloadRef', '_type', '_name')).new(data.dig('payloadRef')) if data['payloadRef']
        @payload_size = data.dig('payloadSize', '_value').to_i
      end
    end

    # - ActionTestExpectedFailure
    #   * Kind: object
    #   * Properties:
    #     + uuid: String
    #     + failureReason: String?
    #     + failureSummary: ActionTestFailureSummary?
    #     + isTopLevelFailure: Bool
    class ActionTestExpectedFailure
      # @return [String] uuid
      attr_reader :uuid
      # @return [String, nil] failureReason
      attr_reader :failure_reason
      # @return [ActionTestFailureSummary, nil] failureSummary
      attr_reader :failure_summary
      # @return [Bool] isTopLevelFailure
      attr_reader :is_top_level_failure
    
      def initialize(data)
        @uuid = data.dig('uuid', '_value')
        @failure_reason = data.dig('failureReason', '_value') if data['failureReason']
        @failure_summary = Models.load_class(data.dig('failureSummary', '_type', '_name')).new(data.dig('failureSummary')) if data['failureSummary']
        @is_top_level_failure = data.dig('isTopLevelFailure', '_value')
      end
    end

    # - ActionTestFailureSummary
    #   * Kind: object
    #   * Properties:
    #     + message: String?
    #     + fileName: String
    #     + lineNumber: Int
    #     + isPerformanceFailure: Bool
    #     + uuid: String
    #     + issueType: String?
    #     + detailedDescription: String?
    #     + attachments: [ActionTestAttachment]
    #     + associatedError: TestAssociatedError?
    #     + sourceCodeContext: SourceCodeContext?
    #     + timestamp: Date?
    #     + isTopLevelFailure: Bool
    class ActionTestFailureSummary
      # @return [String, nil] message
      attr_reader :message
      # @return [String] fileName
      attr_reader :file_name
      # @return [Int] lineNumber
      attr_reader :line_number
      # @return [Bool] isPerformanceFailure
      attr_reader :is_performance_failure
      # @return [String] uuid
      attr_reader :uuid
      # @return [String, nil] issueType
      attr_reader :issue_type
      # @return [String, nil] detailedDescription
      attr_reader :detailed_description
      # @return [Array<ActionTestAttachment>] attachments
      attr_reader :attachments
      # @return [TestAssociatedError, nil] associatedError
      attr_reader :associated_error
      # @return [SourceCodeContext, nil] sourceCodeContext
      attr_reader :source_code_context
      # @return [Date, nil] timestamp
      attr_reader :timestamp
      # @return [Bool] isTopLevelFailure
      attr_reader :is_top_level_failure
    
      def initialize(data)
        @message = data.dig('message', '_value') if data['message']
        @file_name = data.dig('fileName', '_value')
        @line_number = data.dig('lineNumber', '_value').to_i
        @is_performance_failure = data.dig('isPerformanceFailure', '_value')
        @uuid = data.dig('uuid', '_value')
        @issue_type = data.dig('issueType', '_value') if data['issueType']
        @detailed_description = data.dig('detailedDescription', '_value') if data['detailedDescription']
        @attachments = (data.dig('attachments', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
        @associated_error = Models.load_class(data.dig('associatedError', '_type', '_name')).new(data.dig('associatedError')) if data['associatedError']
        @source_code_context = Models.load_class(data.dig('sourceCodeContext', '_type', '_name')).new(data.dig('sourceCodeContext')) if data['sourceCodeContext']
        @timestamp = Time.parse(data.dig('timestamp', '_value')) if data['timestamp']
        @is_top_level_failure = data.dig('isTopLevelFailure', '_value')
      end
    end

    # - ActionTestSummaryIdentifiableObject
    #   * Supertype: ActionAbstractTestSummary
    #   * Kind: object
    #   * Properties:
    #     + identifier: String?
    class ActionTestSummaryIdentifiableObject < ActionAbstractTestSummary
      # @return [String, nil] identifier
      attr_reader :identifier
    
      def initialize(data)
        @identifier = data.dig('identifier', '_value') if data['identifier']
        super
      end
    end

    # - ActionTestMetadata
    #   * Supertype: ActionTestSummaryIdentifiableObject
    #   * Kind: object
    #   * Properties:
    #     + testStatus: String
    #     + duration: Double?
    #     + summaryRef: Reference?
    #     + performanceMetricsCount: Int
    #     + failureSummariesCount: Int
    #     + activitySummariesCount: Int
    class ActionTestMetadata < ActionTestSummaryIdentifiableObject
      # @return [String] testStatus
      attr_reader :test_status
      # @return [Double, nil] duration
      attr_reader :duration
      # @return [Reference, nil] summaryRef
      attr_reader :summary_ref
      # @return [Int] performanceMetricsCount
      attr_reader :performance_metrics_count
      # @return [Int] failureSummariesCount
      attr_reader :failure_summaries_count
      # @return [Int] activitySummariesCount
      attr_reader :activity_summaries_count
    
      def initialize(data)
        @test_status = data.dig('testStatus', '_value')
        @duration = data.dig('duration', '_value').to_f if data['duration']
        @summary_ref = Models.load_class(data.dig('summaryRef', '_type', '_name')).new(data.dig('summaryRef')) if data['summaryRef']
        @performance_metrics_count = data.dig('performanceMetricsCount', '_value').to_i
        @failure_summaries_count = data.dig('failureSummariesCount', '_value').to_i
        @activity_summaries_count = data.dig('activitySummariesCount', '_value').to_i
        super
      end
    end

    # - ActionTestNoticeSummary
    #   * Kind: object
    #   * Properties:
    #     + message: String?
    #     + fileName: String
    #     + lineNumber: Int
    class ActionTestNoticeSummary
      # @return [String, nil] message
      attr_reader :message
      # @return [String] fileName
      attr_reader :file_name
      # @return [Int] lineNumber
      attr_reader :line_number
    
      def initialize(data)
        @message = data.dig('message', '_value') if data['message']
        @file_name = data.dig('fileName', '_value')
        @line_number = data.dig('lineNumber', '_value').to_i
      end
    end

    # - ActionTestPerformanceMetricSummary
    #   * Kind: object
    #   * Properties:
    #     + displayName: String
    #     + unitOfMeasurement: String
    #     + measurements: [Double]
    #     + identifier: String?
    #     + baselineName: String?
    #     + baselineAverage: Double?
    #     + maxPercentRegression: Double?
    #     + maxPercentRelativeStandardDeviation: Double?
    #     + maxRegression: Double?
    #     + maxStandardDeviation: Double?
    #     + polarity: String?
    class ActionTestPerformanceMetricSummary
      # @return [String] displayName
      attr_reader :display_name
      # @return [String] unitOfMeasurement
      attr_reader :unit_of_measurement
      # @return [Array<Double>] measurements
      attr_reader :measurements
      # @return [String, nil] identifier
      attr_reader :identifier
      # @return [String, nil] baselineName
      attr_reader :baseline_name
      # @return [Double, nil] baselineAverage
      attr_reader :baseline_average
      # @return [Double, nil] maxPercentRegression
      attr_reader :max_percent_regression
      # @return [Double, nil] maxPercentRelativeStandardDeviation
      attr_reader :max_percent_relative_standard_deviation
      # @return [Double, nil] maxRegression
      attr_reader :max_regression
      # @return [Double, nil] maxStandardDeviation
      attr_reader :max_standard_deviation
      # @return [String, nil] polarity
      attr_reader :polarity
    
      def initialize(data)
        @display_name = data.dig('displayName', '_value')
        @unit_of_measurement = data.dig('unitOfMeasurement', '_value')
        @measurements = (data.dig('measurements', '_values') || []).map {|d| d.dig('measurements', '_value').to_f }
        @identifier = data.dig('identifier', '_value') if data['identifier']
        @baseline_name = data.dig('baselineName', '_value') if data['baselineName']
        @baseline_average = data.dig('baselineAverage', '_value').to_f if data['baselineAverage']
        @max_percent_regression = data.dig('maxPercentRegression', '_value').to_f if data['maxPercentRegression']
        @max_percent_relative_standard_deviation = data.dig('maxPercentRelativeStandardDeviation', '_value').to_f if data['maxPercentRelativeStandardDeviation']
        @max_regression = data.dig('maxRegression', '_value').to_f if data['maxRegression']
        @max_standard_deviation = data.dig('maxStandardDeviation', '_value').to_f if data['maxStandardDeviation']
        @polarity = data.dig('polarity', '_value') if data['polarity']
      end
    end

    # - ActionTestPlanRunSummaries
    #   * Kind: object
    #   * Properties:
    #     + summaries: [ActionTestPlanRunSummary]
    class ActionTestPlanRunSummaries
      # @return [Array<ActionTestPlanRunSummary>] summaries
      attr_reader :summaries
    
      def initialize(data)
        @summaries = (data.dig('summaries', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
      end
    end

    # - ActionTestPlanRunSummary
    #   * Supertype: ActionAbstractTestSummary
    #   * Kind: object
    #   * Properties:
    #     + testableSummaries: [ActionTestableSummary]
    class ActionTestPlanRunSummary < ActionAbstractTestSummary
      # @return [Array<ActionTestableSummary>] testableSummaries
      attr_reader :testable_summaries
    
      def initialize(data)
        @testable_summaries = (data.dig('testableSummaries', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
        super
      end
    end

    # - ActionTestRepetitionPolicySummary
    #   * Kind: object
    #   * Properties:
    #     + iteration: Int?
    #     + totalIterations: Int?
    #     + repetitionMode: String?
    class ActionTestRepetitionPolicySummary
      # @return [Int, nil] iteration
      attr_reader :iteration
      # @return [Int, nil] totalIterations
      attr_reader :total_iterations
      # @return [String, nil] repetitionMode
      attr_reader :repetition_mode
    
      def initialize(data)
        @iteration = data.dig('iteration', '_value').to_i if data['iteration']
        @total_iterations = data.dig('totalIterations', '_value').to_i if data['totalIterations']
        @repetition_mode = data.dig('repetitionMode', '_value') if data['repetitionMode']
      end
    end

    # - ActionTestSummary
    #   * Supertype: ActionTestSummaryIdentifiableObject
    #   * Kind: object
    #   * Properties:
    #     + testStatus: String
    #     + duration: Double
    #     + performanceMetrics: [ActionTestPerformanceMetricSummary]
    #     + failureSummaries: [ActionTestFailureSummary]
    #     + expectedFailures: [ActionTestExpectedFailure]
    #     + skipNoticeSummary: ActionTestNoticeSummary?
    #     + activitySummaries: [ActionTestActivitySummary]
    #     + repetitionPolicySummary: ActionTestRepetitionPolicySummary?
    class ActionTestSummary < ActionTestSummaryIdentifiableObject
      # @return [String] testStatus
      attr_reader :test_status
      # @return [Double] duration
      attr_reader :duration
      # @return [Array<ActionTestPerformanceMetricSummary>] performanceMetrics
      attr_reader :performance_metrics
      # @return [Array<ActionTestFailureSummary>] failureSummaries
      attr_reader :failure_summaries
      # @return [Array<ActionTestExpectedFailure>] expectedFailures
      attr_reader :expected_failures
      # @return [ActionTestNoticeSummary, nil] skipNoticeSummary
      attr_reader :skip_notice_summary
      # @return [Array<ActionTestActivitySummary>] activitySummaries
      attr_reader :activity_summaries
      # @return [ActionTestRepetitionPolicySummary, nil] repetitionPolicySummary
      attr_reader :repetition_policy_summary
    
      def initialize(data)
        @test_status = data.dig('testStatus', '_value')
        @duration = data.dig('duration', '_value').to_f
        @performance_metrics = (data.dig('performanceMetrics', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
        @failure_summaries = (data.dig('failureSummaries', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
        @expected_failures = (data.dig('expectedFailures', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
        @skip_notice_summary = Models.load_class(data.dig('skipNoticeSummary', '_type', '_name')).new(data.dig('skipNoticeSummary')) if data['skipNoticeSummary']
        @activity_summaries = (data.dig('activitySummaries', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
        @repetition_policy_summary = Models.load_class(data.dig('repetitionPolicySummary', '_type', '_name')).new(data.dig('repetitionPolicySummary')) if data['repetitionPolicySummary']
        super
      end
    end

    # - ActionTestSummaryGroup
    #   * Supertype: ActionTestSummaryIdentifiableObject
    #   * Kind: object
    #   * Properties:
    #     + duration: Double
    #     + subtests: [ActionTestSummaryIdentifiableObject]
    class ActionTestSummaryGroup < ActionTestSummaryIdentifiableObject
      # @return [Double] duration
      attr_reader :duration
      # @return [Array<ActionTestSummaryIdentifiableObject>] subtests
      attr_reader :subtests
    
      def initialize(data)
        @duration = data.dig('duration', '_value').to_f
        @subtests = (data.dig('subtests', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
        super
      end
    end

    # - ActionTestableSummary
    #   * Supertype: ActionAbstractTestSummary
    #   * Kind: object
    #   * Properties:
    #     + projectRelativePath: String?
    #     + targetName: String?
    #     + testKind: String?
    #     + tests: [ActionTestSummaryIdentifiableObject]
    #     + diagnosticsDirectoryName: String?
    #     + failureSummaries: [ActionTestFailureSummary]
    #     + testLanguage: String?
    #     + testRegion: String?
    class ActionTestableSummary < ActionAbstractTestSummary
      # @return [String, nil] projectRelativePath
      attr_reader :project_relative_path
      # @return [String, nil] targetName
      attr_reader :target_name
      # @return [String, nil] testKind
      attr_reader :test_kind
      # @return [Array<ActionTestSummaryIdentifiableObject>] tests
      attr_reader :tests
      # @return [String, nil] diagnosticsDirectoryName
      attr_reader :diagnostics_directory_name
      # @return [Array<ActionTestFailureSummary>] failureSummaries
      attr_reader :failure_summaries
      # @return [String, nil] testLanguage
      attr_reader :test_language
      # @return [String, nil] testRegion
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

    # - ActionsInvocationMetadata
    #   * Kind: object
    #   * Properties:
    #     + creatingWorkspaceFilePath: String
    #     + uniqueIdentifier: String
    #     + schemeIdentifier: EntityIdentifier?
    class ActionsInvocationMetadata
      # @return [String] creatingWorkspaceFilePath
      attr_reader :creating_workspace_file_path
      # @return [String] uniqueIdentifier
      attr_reader :unique_identifier
      # @return [EntityIdentifier, nil] schemeIdentifier
      attr_reader :scheme_identifier
    
      def initialize(data)
        @creating_workspace_file_path = data.dig('creatingWorkspaceFilePath', '_value')
        @unique_identifier = data.dig('uniqueIdentifier', '_value')
        @scheme_identifier = Models.load_class(data.dig('schemeIdentifier', '_type', '_name')).new(data.dig('schemeIdentifier')) if data['schemeIdentifier']
      end
    end

    # - ActionsInvocationRecord
    #   * Kind: object
    #   * Properties:
    #     + metadataRef: Reference?
    #     + metrics: ResultMetrics
    #     + issues: ResultIssueSummaries
    #     + actions: [ActionRecord]
    #     + archive: ArchiveInfo?
    class ActionsInvocationRecord
      # @return [Reference, nil] metadataRef
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

    # - ActivityLogAnalyzerStep
    #   * Kind: object
    #   * Properties:
    #     + parentIndex: Int
    class ActivityLogAnalyzerStep
      # @return [Int] parentIndex
      attr_reader :parent_index
    
      def initialize(data)
        @parent_index = data.dig('parentIndex', '_value').to_i
      end
    end

    # - ActivityLogAnalyzerControlFlowStep
    #   * Supertype: ActivityLogAnalyzerStep
    #   * Kind: object
    #   * Properties:
    #     + title: String
    #     + startLocation: DocumentLocation?
    #     + endLocation: DocumentLocation?
    #     + edges: [ActivityLogAnalyzerControlFlowStepEdge]
    class ActivityLogAnalyzerControlFlowStep < ActivityLogAnalyzerStep
      # @return [String] title
      attr_reader :title
      # @return [DocumentLocation, nil] startLocation
      attr_reader :start_location
      # @return [DocumentLocation, nil] endLocation
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

    # - ActivityLogAnalyzerControlFlowStepEdge
    #   * Kind: object
    #   * Properties:
    #     + startLocation: DocumentLocation?
    #     + endLocation: DocumentLocation?
    class ActivityLogAnalyzerControlFlowStepEdge
      # @return [DocumentLocation, nil] startLocation
      attr_reader :start_location
      # @return [DocumentLocation, nil] endLocation
      attr_reader :end_location
    
      def initialize(data)
        @start_location = Models.load_class(data.dig('startLocation', '_type', '_name')).new(data.dig('startLocation')) if data['startLocation']
        @end_location = Models.load_class(data.dig('endLocation', '_type', '_name')).new(data.dig('endLocation')) if data['endLocation']
      end
    end

    # - ActivityLogAnalyzerEventStep
    #   * Supertype: ActivityLogAnalyzerStep
    #   * Kind: object
    #   * Properties:
    #     + title: String
    #     + location: DocumentLocation?
    #     + description: String
    #     + callDepth: Int
    class ActivityLogAnalyzerEventStep < ActivityLogAnalyzerStep
      # @return [String] title
      attr_reader :title
      # @return [DocumentLocation, nil] location
      attr_reader :location
      # @return [String] description
      attr_reader :description
      # @return [Int] callDepth
      attr_reader :call_depth
    
      def initialize(data)
        @title = data.dig('title', '_value')
        @location = Models.load_class(data.dig('location', '_type', '_name')).new(data.dig('location')) if data['location']
        @description = data.dig('description', '_value')
        @call_depth = data.dig('callDepth', '_value').to_i
        super
      end
    end

    # - ActivityLogMessage
    #   * Kind: object
    #   * Properties:
    #     + type: String
    #     + title: String
    #     + shortTitle: String?
    #     + category: String?
    #     + location: DocumentLocation?
    #     + annotations: [ActivityLogMessageAnnotation]
    class ActivityLogMessage
      # @return [String] type
      attr_reader :type
      # @return [String] title
      attr_reader :title
      # @return [String, nil] shortTitle
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

    # - ActivityLogAnalyzerResultMessage
    #   * Supertype: ActivityLogMessage
    #   * Kind: object
    #   * Properties:
    #     + steps: [ActivityLogAnalyzerStep]
    #     + resultType: String?
    #     + keyEventIndex: Int
    class ActivityLogAnalyzerResultMessage < ActivityLogMessage
      # @return [Array<ActivityLogAnalyzerStep>] steps
      attr_reader :steps
      # @return [String, nil] resultType
      attr_reader :result_type
      # @return [Int] keyEventIndex
      attr_reader :key_event_index
    
      def initialize(data)
        @steps = (data.dig('steps', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
        @result_type = data.dig('resultType', '_value') if data['resultType']
        @key_event_index = data.dig('keyEventIndex', '_value').to_i
        super
      end
    end

    # - ActivityLogAnalyzerWarningMessage
    #   * Supertype: ActivityLogMessage
    #   * Kind: object
    class ActivityLogAnalyzerWarningMessage < ActivityLogMessage
    
      def initialize(data)
        super
      end
    end

    # - ActivityLogSection
    #   * Kind: object
    #   * Properties:
    #     + domainType: String
    #     + title: String
    #     + startTime: Date?
    #     + duration: Double
    #     + result: String?
    #     + location: DocumentLocation?
    #     + subsections: [ActivityLogSection]
    #     + messages: [ActivityLogMessage]
    class ActivityLogSection
      # @return [String] domainType
      attr_reader :domain_type
      # @return [String] title
      attr_reader :title
      # @return [Date, nil] startTime
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
        @start_time = Time.parse(data.dig('startTime', '_value')) if data['startTime']
        @duration = data.dig('duration', '_value').to_f
        @result = data.dig('result', '_value') if data['result']
        @location = Models.load_class(data.dig('location', '_type', '_name')).new(data.dig('location')) if data['location']
        @subsections = (data.dig('subsections', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
        @messages = (data.dig('messages', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
      end
    end

    # - ActivityLogCommandInvocationSection
    #   * Supertype: ActivityLogSection
    #   * Kind: object
    #   * Properties:
    #     + commandDetails: String
    #     + emittedOutput: String
    #     + exitCode: Int?
    class ActivityLogCommandInvocationSection < ActivityLogSection
      # @return [String] commandDetails
      attr_reader :command_details
      # @return [String] emittedOutput
      attr_reader :emitted_output
      # @return [Int, nil] exitCode
      attr_reader :exit_code
    
      def initialize(data)
        @command_details = data.dig('commandDetails', '_value')
        @emitted_output = data.dig('emittedOutput', '_value')
        @exit_code = data.dig('exitCode', '_value').to_i if data['exitCode']
        super
      end
    end

    # - ActivityLogMajorSection
    #   * Supertype: ActivityLogSection
    #   * Kind: object
    #   * Properties:
    #     + subtitle: String
    class ActivityLogMajorSection < ActivityLogSection
      # @return [String] subtitle
      attr_reader :subtitle
    
      def initialize(data)
        @subtitle = data.dig('subtitle', '_value')
        super
      end
    end

    # - ActivityLogMessageAnnotation
    #   * Kind: object
    #   * Properties:
    #     + title: String
    #     + location: DocumentLocation?
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

    # - ActivityLogTargetBuildSection
    #   * Supertype: ActivityLogMajorSection
    #   * Kind: object
    #   * Properties:
    #     + productType: String?
    class ActivityLogTargetBuildSection < ActivityLogMajorSection
      # @return [String, nil] productType
      attr_reader :product_type
    
      def initialize(data)
        @product_type = data.dig('productType', '_value') if data['productType']
        super
      end
    end

    # - ActivityLogUnitTestSection
    #   * Supertype: ActivityLogSection
    #   * Kind: object
    #   * Properties:
    #     + testName: String?
    #     + suiteName: String?
    #     + summary: String?
    #     + emittedOutput: String?
    #     + performanceTestOutput: String?
    #     + testsPassedString: String?
    #     + wasSkipped: Bool
    #     + runnablePath: String?
    #     + runnableUTI: String?
    class ActivityLogUnitTestSection < ActivityLogSection
      # @return [String, nil] testName
      attr_reader :test_name
      # @return [String, nil] suiteName
      attr_reader :suite_name
      # @return [String, nil] summary
      attr_reader :summary
      # @return [String, nil] emittedOutput
      attr_reader :emitted_output
      # @return [String, nil] performanceTestOutput
      attr_reader :performance_test_output
      # @return [String, nil] testsPassedString
      attr_reader :tests_passed_string
      # @return [Bool] wasSkipped
      attr_reader :was_skipped
      # @return [String, nil] runnablePath
      attr_reader :runnable_path
      # @return [String, nil] runnableUTI
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

    # - ArchiveInfo
    #   * Kind: object
    #   * Properties:
    #     + path: String?
    class ArchiveInfo
      # @return [String, nil] path
      attr_reader :path
    
      def initialize(data)
        @path = data.dig('path', '_value') if data['path']
      end
    end

    # - Array
    #   * Kind: array
    class Array
    
      def initialize(data)
      end
    end

    # - Bool
    #   * Kind: value
    class Bool
    
      def initialize(data)
      end
    end

    # - CodeCoverageInfo
    #   * Kind: object
    #   * Properties:
    #     + hasCoverageData: Bool
    #     + reportRef: Reference?
    #     + archiveRef: Reference?
    class CodeCoverageInfo
      # @return [Bool] hasCoverageData
      attr_reader :has_coverage_data
      # @return [Reference, nil] reportRef
      attr_reader :report_ref
      # @return [Reference, nil] archiveRef
      attr_reader :archive_ref
    
      def initialize(data)
        @has_coverage_data = data.dig('hasCoverageData', '_value')
        @report_ref = Models.load_class(data.dig('reportRef', '_type', '_name')).new(data.dig('reportRef')) if data['reportRef']
        @archive_ref = Models.load_class(data.dig('archiveRef', '_type', '_name')).new(data.dig('archiveRef')) if data['archiveRef']
      end
    end

    # - Date
    #   * Kind: value
    class Date
    
      def initialize(data)
      end
    end

    # - DocumentLocation
    #   * Kind: object
    #   * Properties:
    #     + url: String
    #     + concreteTypeName: String
    class DocumentLocation
      # @return [String] url
      attr_reader :url
      # @return [String] concreteTypeName
      attr_reader :concrete_type_name
    
      def initialize(data)
        @url = data.dig('url', '_value')
        @concrete_type_name = data.dig('concreteTypeName', '_value')
      end
    end

    # - Double
    #   * Kind: value
    class Double
    
      def initialize(data)
      end
    end

    # - EntityIdentifier
    #   * Kind: object
    #   * Properties:
    #     + entityName: String
    #     + containerName: String
    #     + entityType: String
    #     + sharedState: String
    class EntityIdentifier
      # @return [String] entityName
      attr_reader :entity_name
      # @return [String] containerName
      attr_reader :container_name
      # @return [String] entityType
      attr_reader :entity_type
      # @return [String] sharedState
      attr_reader :shared_state
    
      def initialize(data)
        @entity_name = data.dig('entityName', '_value')
        @container_name = data.dig('containerName', '_value')
        @entity_type = data.dig('entityType', '_value')
        @shared_state = data.dig('sharedState', '_value')
      end
    end

    # - Int
    #   * Kind: value
    class Int
    
      def initialize(data)
      end
    end

    # - IssueSummary
    #   * Kind: object
    #   * Properties:
    #     + issueType: String
    #     + message: String
    #     + producingTarget: String?
    #     + documentLocationInCreatingWorkspace: DocumentLocation?
    class IssueSummary
      # @return [String] issueType
      attr_reader :issue_type
      # @return [String] message
      attr_reader :message
      # @return [String, nil] producingTarget
      attr_reader :producing_target
      # @return [DocumentLocation, nil] documentLocationInCreatingWorkspace
      attr_reader :document_location_in_creating_workspace
    
      def initialize(data)
        @issue_type = data.dig('issueType', '_value')
        @message = data.dig('message', '_value')
        @producing_target = data.dig('producingTarget', '_value') if data['producingTarget']
        @document_location_in_creating_workspace = Models.load_class(data.dig('documentLocationInCreatingWorkspace', '_type', '_name')).new(data.dig('documentLocationInCreatingWorkspace')) if data['documentLocationInCreatingWorkspace']
      end
    end

    # - ObjectID
    #   * Kind: object
    #   * Properties:
    #     + hash: String
    class ObjectID
      # @return [String] hash
      attr_reader :hash
    
      def initialize(data)
        @hash = data.dig('hash', '_value')
      end
    end

    # - Reference
    #   * Kind: object
    #   * Properties:
    #     + id: String
    #     + targetType: TypeDefinition?
    class Reference
      # @return [String] id
      attr_reader :id
      # @return [TypeDefinition, nil] targetType
      attr_reader :target_type
    
      def initialize(data)
        @id = data.dig('id', '_value')
        @target_type = Models.load_class(data.dig('targetType', '_type', '_name')).new(data.dig('targetType')) if data['targetType']
      end
    end

    # - ResultIssueSummaries
    #   * Kind: object
    #   * Properties:
    #     + analyzerWarningSummaries: [IssueSummary]
    #     + errorSummaries: [IssueSummary]
    #     + testFailureSummaries: [TestFailureIssueSummary]
    #     + warningSummaries: [IssueSummary]
    class ResultIssueSummaries
      # @return [Array<IssueSummary>] analyzerWarningSummaries
      attr_reader :analyzer_warning_summaries
      # @return [Array<IssueSummary>] errorSummaries
      attr_reader :error_summaries
      # @return [Array<TestFailureIssueSummary>] testFailureSummaries
      attr_reader :test_failure_summaries
      # @return [Array<IssueSummary>] warningSummaries
      attr_reader :warning_summaries
    
      def initialize(data)
        @analyzer_warning_summaries = (data.dig('analyzerWarningSummaries', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
        @error_summaries = (data.dig('errorSummaries', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
        @test_failure_summaries = (data.dig('testFailureSummaries', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
        @warning_summaries = (data.dig('warningSummaries', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
      end
    end

    # - ResultMetrics
    #   * Kind: object
    #   * Properties:
    #     + analyzerWarningCount: Int
    #     + errorCount: Int
    #     + testsCount: Int
    #     + testsFailedCount: Int
    #     + testsSkippedCount: Int
    #     + warningCount: Int
    class ResultMetrics
      # @return [Int] analyzerWarningCount
      attr_reader :analyzer_warning_count
      # @return [Int] errorCount
      attr_reader :error_count
      # @return [Int] testsCount
      attr_reader :tests_count
      # @return [Int] testsFailedCount
      attr_reader :tests_failed_count
      # @return [Int] testsSkippedCount
      attr_reader :tests_skipped_count
      # @return [Int] warningCount
      attr_reader :warning_count
    
      def initialize(data)
        @analyzer_warning_count = data.dig('analyzerWarningCount', '_value').to_i
        @error_count = data.dig('errorCount', '_value').to_i
        @tests_count = data.dig('testsCount', '_value').to_i
        @tests_failed_count = data.dig('testsFailedCount', '_value').to_i
        @tests_skipped_count = data.dig('testsSkippedCount', '_value').to_i
        @warning_count = data.dig('warningCount', '_value').to_i
      end
    end

    # - SortedKeyValueArray
    #   * Kind: object
    #   * Properties:
    #     + storage: [SortedKeyValueArrayPair]
    class SortedKeyValueArray
      # @return [Array<SortedKeyValueArrayPair>] storage
      attr_reader :storage
    
      def initialize(data)
        @storage = (data.dig('storage', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
      end
    end

    # - SortedKeyValueArrayPair
    #   * Kind: object
    #   * Properties:
    #     + key: String
    #     + value: SchemaSerializable
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

    # - SourceCodeContext
    #   * Kind: object
    #   * Properties:
    #     + location: SourceCodeLocation?
    #     + callStack: [SourceCodeFrame]
    class SourceCodeContext
      # @return [SourceCodeLocation, nil] location
      attr_reader :location
      # @return [Array<SourceCodeFrame>] callStack
      attr_reader :call_stack
    
      def initialize(data)
        @location = Models.load_class(data.dig('location', '_type', '_name')).new(data.dig('location')) if data['location']
        @call_stack = (data.dig('callStack', '_values') || []).map {|d| Models.load_class(d.dig('_type', '_name')).new(d) }
      end
    end

    # - SourceCodeFrame
    #   * Kind: object
    #   * Properties:
    #     + addressString: String?
    #     + symbolInfo: SourceCodeSymbolInfo?
    class SourceCodeFrame
      # @return [String, nil] addressString
      attr_reader :address_string
      # @return [SourceCodeSymbolInfo, nil] symbolInfo
      attr_reader :symbol_info
    
      def initialize(data)
        @address_string = data.dig('addressString', '_value') if data['addressString']
        @symbol_info = Models.load_class(data.dig('symbolInfo', '_type', '_name')).new(data.dig('symbolInfo')) if data['symbolInfo']
      end
    end

    # - SourceCodeLocation
    #   * Kind: object
    #   * Properties:
    #     + filePath: String?
    #     + lineNumber: Int?
    class SourceCodeLocation
      # @return [String, nil] filePath
      attr_reader :file_path
      # @return [Int, nil] lineNumber
      attr_reader :line_number
    
      def initialize(data)
        @file_path = data.dig('filePath', '_value') if data['filePath']
        @line_number = data.dig('lineNumber', '_value').to_i if data['lineNumber']
      end
    end

    # - SourceCodeSymbolInfo
    #   * Kind: object
    #   * Properties:
    #     + imageName: String?
    #     + symbolName: String?
    #     + location: SourceCodeLocation?
    class SourceCodeSymbolInfo
      # @return [String, nil] imageName
      attr_reader :image_name
      # @return [String, nil] symbolName
      attr_reader :symbol_name
      # @return [SourceCodeLocation, nil] location
      attr_reader :location
    
      def initialize(data)
        @image_name = data.dig('imageName', '_value') if data['imageName']
        @symbol_name = data.dig('symbolName', '_value') if data['symbolName']
        @location = Models.load_class(data.dig('location', '_type', '_name')).new(data.dig('location')) if data['location']
      end
    end

    # - String
    #   * Kind: value
    class String
    
      def initialize(data)
      end
    end

    # - TestAssociatedError
    #   * Kind: object
    #   * Properties:
    #     + domain: String?
    #     + code: Int?
    #     + userInfo: SortedKeyValueArray?
    class TestAssociatedError
      # @return [String, nil] domain
      attr_reader :domain
      # @return [Int, nil] code
      attr_reader :code
      # @return [SortedKeyValueArray, nil] userInfo
      attr_reader :user_info
    
      def initialize(data)
        @domain = data.dig('domain', '_value') if data['domain']
        @code = data.dig('code', '_value').to_i if data['code']
        @user_info = Models.load_class(data.dig('userInfo', '_type', '_name')).new(data.dig('userInfo')) if data['userInfo']
      end
    end

    # - TestFailureIssueSummary
    #   * Supertype: IssueSummary
    #   * Kind: object
    #   * Properties:
    #     + testCaseName: String
    class TestFailureIssueSummary < IssueSummary
      # @return [String] testCaseName
      attr_reader :test_case_name
    
      def initialize(data)
        @test_case_name = data.dig('testCaseName', '_value')
        super
      end
    end

    # - TypeDefinition
    #   * Kind: object
    #   * Properties:
    #     + name: String
    #     + supertype: TypeDefinition?
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
