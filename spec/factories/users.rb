FactoryGirl.define do
  factory :user do
    name 'Admin'
    last_name 'Test'
    sequence(:email) { |i| "admin_test#{i}@gmail.com" }
    password '12345678'
    password_confirmation '12345678'
    admin true
  end

  factory :user_test, class: :user do
    name 'Test'
    last_name 'Test'
    sequence(:email) { |i| "user_test#{i}@gmail.com" }
    password '12345678'
    password_confirmation '12345678'
    admin false
  end
end
