require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

# rubocop:disable Lint/Debugger
task :console do
    require 'pry'
    require 'date'
    require 'date_utils'
    Date.include(DateUtils)
    puts 'loading pry...'
    binding.pry
end
# rubocop:enable Lint/Debugger