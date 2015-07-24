FactoryGirl.define do
  factory :user do
    name "Bruce"
    last_name "Waine"
    email 'bruce_waine@gmail.com'
    password "12345678"
    password_confirmation "12345678"
    admin true
  end
end
