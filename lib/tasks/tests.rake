require 'rubocop/rake_task'

# Clear out rails' test tasks
Rake::Task.tasks.each do |task|
  task.clear if task.name == 'test' || task.name.start_with?('test:')
end

desc 'Runs all test tasks'
task test: %w( spec test:all )

namespace :test do
  task all: [:rubocop]

  desc 'Runs rubocop on the source'

  desc 'Run RuboCop on the lib directory'
  RuboCop::RakeTask.new(:rubocop) do |task|
    task.options.concat %w( --rails --display-cop-names --force-exclusion )
    task.patterns = %w(
      Gemfile
      Guardfile
      app/**/*.rb
      bin/**/*.rb
      config/**/*.rb
      db/**/*.rb
      lib/**/*.rb
      spec/**/*.rb
      test/**/*.rb
    )
  end
end
