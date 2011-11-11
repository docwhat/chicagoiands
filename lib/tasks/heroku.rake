namespace :heroku do
  desc "Clone the live database for testing"
  task :pull do
    system "heroku db:pull --confirm chicagoiands"
  end

  desc "Deploy the git repository to heroku"
  task :deploy do
    system "git push git@heroku.com:chicagoiands.git master"
    system "heroku run rake db:migrate"
  end

  # TODO db:migrate

  desc "Import the checked in copy of the old-site's data"
  task :import do
    system "heroku run rake import"
  end
end