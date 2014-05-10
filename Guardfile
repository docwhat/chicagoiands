# coding: utf-8
# vi: ft=ruby :

group :red_green_refactor, halt_on_fail: true do
  guard(
    :bundler
  ) do
    watch('Gemfile')
  end

  guard(
    :migrate
  ) do
    watch(%r{^db/migrate/(\d+).+\.rb})
  end

  guard(
    :rspec,
    cmd: 'bin/rspec',
    failed_mode: :keep,
    all_after_pass: true,
    all_on_start: true,
    run_all: {
      cmd: 'bin/rspec --format progress'
    }
  ) do
    watch(%r{^spec/.+_spec\.rb$})
    watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
    watch('spec/spec_helper.rb')  { 'spec' }

    # Rails
    watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
    watch(%r{^app/(.*)(\.erb|\.haml)$})                 { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
    watch(%r{^app/controllers/(.+)_(controller)\.rb$})  do |m|
      [
        "spec/routing/#{m[1]}_routing_spec.rb",
        "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb",
        "spec/acceptance/#{m[1]}_spec.rb"
      ]
    end
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

  guard(
    :rubocop,
    cli: '--rails --display-cop-names --config .rubocop.yml'
  ) do
    watch(/.+\.rb$/) { Dir['**/*.rb'] }
    watch(%r{(?:.+/)?\.rubocop\.yml$}) { |m| File.dirname(m[0]) }
  end
end
