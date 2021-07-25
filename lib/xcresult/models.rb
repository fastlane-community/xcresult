# frozen_string_literal: true

require 'xcresult/models.gen'

# This file is meant to define extensions to generated models in models.gen.rb.
module XCResult
  module Models
    def self.load_class(class_name)
      Kernel.const_get("XCResult::Models::#{class_name}")
    end

    class ActionTestableSummary
      def all_tests
        tests.map(&:all_subtests).flatten
      end
    end

    class ActionTestSummaryIdentifiableObject
      def all_subtests
        raise 'Not overridden'
      end
    end

    class ActionTestSummaryGroup
      def all_subtests
        subtests.map(&:all_subtests).flatten
      end
    end

    class ActionTestMetadata
      def all_subtests
        [self]
      end

      def find_failure(failures)
        if test_status == 'Failure'
          # Tries to match failure on test case name
          # Example TestFailureIssueSummary:
          #   producingTarget: "TestThisDude"
          #   test_case_name: "TestThisDude.testFailureJosh2()" (when Swift)
          #     or "-[TestThisDudeTests testFailureJosh2]" (when Objective-C)
          # Example ActionTestMetadata
          #   identifier: "TestThisDude/testFailureJosh2()" (when Swift)
          #     or identifier: "TestThisDude/testFailureJosh2" (when Objective-C)

          found_failure = failures.find do |failure|
            # Clean test_case_name to match identifier format
            # Sanitize for Swift by replacing "." for "/"
            # Sanitize for Objective-C by removing "-", "[", "]", and replacing " " for ?/
            sanitized_test_case_name = failure.test_case_name
                                         .tr('.', '/')
                                         .tr('-', '')
                                         .tr('[', '')
                                         .tr(']', '')
                                         .tr(' ', '/')
            identifier == sanitized_test_case_name
          end
          found_failure
        end
      end
    end

    class TestFailureIssueSummary
      def failure_message
        new_message = message
        if document_location_in_creating_workspace
          file_path = document_location_in_creating_workspace.url.gsub('file://', '')
          new_message += " (#{file_path})"
        end

        new_message
      end
    end
  end
end
