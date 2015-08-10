FactoryGirl.define do
  factory :book do
    title "Conhecendo Ruby"
    author "Eustáquio"
    ISBN "978-85-5519-012-4"
    language "Inglês"
    description "Livro ruby iniciante"
    image_book_file_name { 'test.jpg' }
    image_book_content_type { 'image/jpg' }
    image_book_file_size { 1024 }
  end

end
