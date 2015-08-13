FactoryGirl.define do
  factory :rating do
    points 1
    comment "Livro legal"
    relations :user
    relations :book
  end

end
