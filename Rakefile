require 'east'
require 'resque/tasks'

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs.push 'spec'
  t.pattern = 'spec/**/*_spec.rb'
  t.warning = true
  t.verbose = true
end

task :default => :test
