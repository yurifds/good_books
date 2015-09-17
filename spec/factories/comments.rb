FactoryGirl.define do
  factory :comment do
    body 'Test reply comment'
    commentable_type 'Book'
    association :user
  end
end
