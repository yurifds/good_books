FactoryGirl.define do
  factory :book do
    title "Conhecendo Ruby"
    author "Eustáquio"
    description "Livro ruby iniciante"
    amazon_id "12345"
    association :category
  end

end
