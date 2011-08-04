class User < ActiveRecord::Base
  attr_accessible :logon, :email, :password, :password_confirmation
  has_secure_password

  validates_presence_of :logon
  validates_uniqueness_of :logon

  validates_presence_of :email
  validates_uniqueness_of :email

  validates_presence_of :password, :on => :create
end
