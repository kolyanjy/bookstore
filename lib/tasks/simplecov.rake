namespace :simplecov do
  desc 'merge_results'
  task report_coverage: :environment do
    require Rails.root.join('spec', 'support', 'simplecov_merger')
    SimpleCovHelper.report_coverage
  end
end
