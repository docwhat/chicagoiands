# coding: utf-8

# Be sure to restart your server when you modify this file.

Chicagoiands::Application.config.session_store(
  :cookie_store,
  key: '_chicagoiands_session',
  #  secure: Rails.env == 'production', # Only send cookie over SSL when in production mode
  httponly: true, # Don't allow Javascript to access the cookie (mitigates cookie-based XSS exploits)
  expire_after: 60.minutes
)

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Chicagoiands::Application.config.session_store :active_record_store
