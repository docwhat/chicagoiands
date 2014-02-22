# encoding: utf-8
namespace :heroku do
  desc 'Clone the live database for testing'
  task :pull do
    system 'dropdb chicagoiands-devel'
    system 'heroku pg:pull DATABASE_URL chicagoiands-devel'
  end

  desc 'Deploy the git repository to heroku'
  task :deploy do
    system 'git push git@heroku.com:chicagoiands.git master'
    system 'heroku run rake db:migrate'
  end

  # TODO: db:migrate
end
