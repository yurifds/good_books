FactoryGirl.define do
  factory :book do
    title "Conhecendo Ruby"
    author "Eustáquio"
    description "Livro ruby iniciante"
    association :category
  end

end
