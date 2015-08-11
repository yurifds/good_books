FactoryGirl.define do
  factory :user do
    name "Bruce"
    last_name "Waine"
    sequence(:email){ |i| "bruce_waine#{i}@gmail.com" } 
    password "12345678"
    password_confirmation "12345678"
    admin true
  end
end
