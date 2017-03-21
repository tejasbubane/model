require 'rake'
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

require 'rake/testtask'
Rake::TestTask.new do |t|
  t.pattern = 'test/**/*_test.rb'
  t.libs.push 'test'
  t.warning = false
end

Rake::TestTask.new do |t|
  t.name = 'unit'
  t.test_files = Dir['test/**/*_test.rb'].reject do |path|
    path.include?('/integration')
  end
  t.libs.push 'test'
  t.warning = false
end

Rake::TestTask.new do |t|
  t.name = 'integration'
  t.pattern = 'test/integration/**/*_test.rb'
  t.libs.push 'test'
  t.warning = false
end

namespace :test do
  task :coverage do
    ENV['COVERAGE'] = 'true'
    Rake::Task['test'].invoke
  end

  desc 'Runs only unit tests'
  task :unit do
    Rake::Task['unit'].invoke
  end

  desc 'Run only integration tests'
  task :integration do
    Rake::Task['integration'].invoke
  end
end


namespace :spec do
  RSpec::Core::RakeTask.new(:unit) do |task|
    file_list = FileList['spec/**/*_spec.rb']
    file_list = file_list.exclude("spec/{integration,isolation}/**/*_spec.rb")

    task.pattern = file_list
  end

  task :coverage do
    ENV['COVERAGE'] = 'true'
    Rake::Task['spec:unit'].invoke
  end
end

task default: 'spec:unit'
