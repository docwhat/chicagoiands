# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)

# We want to be emailed on errors
Chicagoiands::Application.config.middleware.use ExceptionNotifier,
  :email_prefix => "[Chicagoiands] ",
  :sender_address => %{"notifier" <notifier@gerf.org>},
  :exception_recipients => %w{docwhat@gerf.org}

run Chicagoiands::Application
