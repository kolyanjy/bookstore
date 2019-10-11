require 'open-uri'
require 'active_support/inflector'
require 'simplecov'

class SimpleCovHelper
  def self.report_coverage(base_dir: './coverage_results')
    SimpleCov.start 'rails' do
      skip_check_coverage = ENV.fetch('SKIP_COVERAGE_CHECK', 'false')
      add_filter '/spec/'
      add_filter '/config/'
      add_filter '/vendor/'
      add_filter '/app/admin/'
      Dir['app/*'].each do |dir|
        add_group File.basename(dir).humanize, dir
      end
      minimum_coverage(100) unless skip_check_coverage
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
    results = all_results.map { |file| SimpleCov::Result.from_hash(JSON.parse(File.read(file))) }
    SimpleCov::ResultMerger.merge_results(*results).tap do |result|
      SimpleCov::ResultMerger.store_result(result)
    end
  end
end

# api_url = "https://circleci.com/api/v1.1/project/github/#{ENV['CIRCLE_PROJECT_USERNAME']}/#{ENV['CIRCLE_PROJECT_REPONAME']}/#{ENV['CIRCLE_BUILD_NUM']}/artifacts?circle-token=#{ENV['API_TOKEN']}"
# artifacts = open(api_url)
# coverage_dir = 'coverage_results'
# SimpleCov.coverage_dir(coverage_dir)
# JSON.load(artifacts)
#     .map do |artifact|
#       path = artifact['path']
#       next if !(path.end_with?('/.resultset.json') && path.include?('/coverage/'))
#       JSON.load(open("#{artifact['url']}?circle-token=#{Rails.application.credentials[:bookstore_token]}"))
#     end.compact
#     .each_with_index do |resultset, i|
#       resultset.each do |_, data|
#         result = SimpleCov::Result.from_hash(['command', i].join => data)
#         SimpleCov::ResultMerger.store_result(result)
#       end
#     end

# merged_result = SimpleCov::ResultMerger.merged_result
# merged_result.command_name = 'RSpec'

# SimpleCovHelper.report_coverage
