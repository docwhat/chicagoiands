# -*- ruby -*-
# More info at https://github.com/guard/guard#readme

# Ensure we're in test mode.
ENV["RAILS_ENV"] ||= 'test'

require 'active_support/inflector'

guard 'bundler' do
  watch('Gemfile')
  # Uncomment next line if Gemfile contain `gemspec' command
  # watch(/^.+\.gemspec/)
end

guard 'migrate' do
  watch(%r{^db/migrate/(\d+).+\.rb})
end

guard 'rspec', :version => 2, :cli => "--color --format documentation --fail-fast" do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }

  # Rails example
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^lib/(.+)\.rb$})                           { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/routing/#{m[1]}_routing_spec.rb",
                                                             "spec/#{m[2].pluralize}/#{m[1]}_#{m[2]}_spec.rb",
                                                             "spec/acceptance/#{m[1]}_spec.rb"] }
  watch(%r{^app/models/(.+)\.rb$})                    { |m| "spec/controllers/#{m[1].pluralize}_controller_spec.rb" }
  watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
  watch(%r{^spec/[^/]+.rb$})                          { "spec" }
  watch('config/routes.rb')                           { "spec/routing" }
  watch('app/controllers/application_controller.rb')  { "spec/controllers" }
  # Capybara request specs
  watch(%r{^app/views/(.+)/.*\.(erb|haml)$})          { |m| "spec/requests/#{m[1]}_spec.rb" }
  # Views
  watch(%r{^app/views/(.+)/(_.*)\.(erb|haml)$})       { |m| "spec/views/#{m[1]}_#{m[2]}_partial_spec.rb" }
  watch(%r{^app/views/(.+)/([^_].*)\.(erb|haml)$})    { |m| "spec/views/#{m[1]}_#{m[2]}_spec.rb" }
end

# EOF
