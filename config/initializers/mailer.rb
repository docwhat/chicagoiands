
ActionMailer::Base.smtp_settings = {
  #:address              => "smtp.gmail.com",
  address: 'gmail-smtp-in.l.google.com',
  port: 25,
  domain: 'chicagoiands.org',
  enable_starttls_auto: false
}
