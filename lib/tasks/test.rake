# Clear out rails' test tasks
Rake::Task.tasks.each do |task|
  task.clear if task.name == 'test' || task.name.start_with?('test:')
end

desc 'Runs all test tasks'
task test: %w( spec rubocop )
