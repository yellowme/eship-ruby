require "bundler/gem_tasks"
require "rspec/core/rake_task"
require 'app_version_tasks'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

spec = Gem::Specification.find_by_name 'app_version_tasks'
load "#{spec.gem_dir}/lib/tasks/app_version_tasks.rake"
AppVersionTasks.configure do |config|
  config.application_name = 'Eship-ruby'
  config.version_file_path = File.join('lib', 'eship', 'version.rb')
end
