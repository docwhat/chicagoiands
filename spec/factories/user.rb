FactoryGirl.define do
  factory :user do
    sequence(:logon) { |n| "johndoe#{n}" }
    password "foobar"
    password_confirmation {|u| u.password}
  end
end
