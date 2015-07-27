FactoryGirl.define do
  factory :book do
    title "Conhecendo Ruby"
    author "Eustáquio"
    description "Livro ruby iniciante"
    image_book_file_name { 'test.jpg' }
    image_book_content_type { 'image/jpg' }
    image_book_file_size { 1024 }
    association :category
  end

end
