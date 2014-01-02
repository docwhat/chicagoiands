# coding: utf-8

guard 'bundler' do
  watch('Gemfile')
  # Uncomment next line if Gemfile contain `gemspec' command
  # watch(/^.+\.gemspec/)
end

guard 'rspec', cmd: 'spring rspec' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { 'spec' }

  # Rails
  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^app/(.*)(\.erb|\.haml)$})                 { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }
  watch(%r{^spec/support/(.+)\.rb$})                  { 'spec' }
  watch('config/routes.rb')                           { 'spec/routing' }
  watch('app/controllers/application_controller.rb')  { 'spec/controllers' }

  # Views
  watch(%r{^app/views/(.+)/})                         { |m| "spec/views/#{m[1]}_spec.rb" }
  watch(%r{^app/views/(.+)/_(.*)\.(erb|haml)$})       { |m| "spec/views/#{m[1]}_#{m[2]}_partial_spec.rb" }
  watch(%r{^app/views/(.+)/([^_].*)\.(erb|haml)$})    { |m| "spec/views/#{m[1]}_#{m[2]}_spec.rb" }

  ## FactoryGirl
  watch(%r{^spec/factories/.*\.rb$})                  { 'spec/factories_spec.rb' }
  watch('spec/factories_spec.rb')                     { 'spec/factories' }
end
