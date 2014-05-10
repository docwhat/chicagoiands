class User < ActiveRecord::Base
  attr_accessible :logon, :password, :password_confirmation
  has_secure_password

  validates :logon, presence: true, uniqueness: true
  validates :password, presence: true, on: :create
end
