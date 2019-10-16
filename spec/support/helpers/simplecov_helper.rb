require 'simplecov'
require 'json'
class SimpleCovHelper
  def self.report_coverage(base_dir: './coverage_results') # rubocop:disable Metrics/MethodLength
    SimpleCov.start 'rails' do
      skip_check_coverage = ENV.fetch('SKIP_COVERAGE_CHECK') { false }
      add_filter '/spec/'
      add_filter '/config/'
      add_filter '/vendor/'
      add_filter '/app/admin/'
      add_filter '/app/channels/'
      minimum_coverage(0) unless skip_check_coverage
      merge_timeout(3600)
    end
    new(base_dir: base_dir).merge_results
  end

  attr_reader :base_dir

  def initialize(base_dir:)
    @base_dir = base_dir
  end

  def all_results
    Dir["#{base_dir}/.resultset*.json"]
  end

  def merge_results
    results = all_results.map do |file|
      SimpleCov::Result.from_hash(JSON.parse(File.read(file)))
    end
    SimpleCov::ResultMerger.merge_results(*results).tap do |result|
      SimpleCov::ResultMerger.store_result(result)
    end
  end
end
