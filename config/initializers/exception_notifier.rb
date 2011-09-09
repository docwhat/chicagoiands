# We want to be emailed on errors
Chicagoiands::Application.config.middleware.use ExceptionNotifier,
  :email_prefix => "[Chicagoiands] ",
  :sender_address => %{"notifier" <notifier@chicagoiands.org>},
  :exception_recipients => %w{docwhat@gmail.com}

ActionMailer::Base.smtp_settings = {
    #:address              => "smtp.gmail.com",
    :address  => "gmail-smtp-in.l.google.com",
    :port     => 25,
    :domain   => "chicagoiands.org",
    :enable_starttls_auto => false
}