# encoding: utf-8
namespace :heroku do
  desc 'Clone the live database for testing'
  task :clone do
    system 'dropdb chicagoiands-devel'
    system 'heroku pg:pull DATABASE_URL chicagoiands-devel'
  end
end
