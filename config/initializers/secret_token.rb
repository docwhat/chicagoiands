# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
Chicagoiands::Application.config.secret_token = if Rails.env == 'production'
                                                  ENV['RAILS_SECRET_TOKEN']
                                                else
                                                  '5fc528415ec8e249c1d241393086aa4ac4ed1707c5fb474f2e5436c5e1e52f9b1d76036a9421ca6e9034b0aefc20c4120af32a6dbc7d46221c2abf61f5c71f5f'
                                                end
