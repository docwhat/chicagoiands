FactoryGirl.define do
  factory :user do
    sequence(:logon) { |n| "johndoe#{n}" }
    password 'foobar'
    password_confirmation { |u| u.password } # rubocop:disable Style/SymbolProc
  end
end
