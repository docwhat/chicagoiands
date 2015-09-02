desc 'Used for Travis CI'
task :travis do
  fail 'You must run this with RAILS_ENV=test' unless ENV['RAILS_ENV'] == 'test'
  Rake::Task['environment'].invoke
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].execute
  Rake::Task['test'].invoke
end
