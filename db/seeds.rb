# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

100.times do |index|
  Book.create! title: "PRACTICAL OBJECT-ORIENTED DESIGN IN RUBY#{index}",
               author: "SANDI METZ#{index}",
               ISBN: "978852092277#{index}", language: "ingles",
               image_book: Rack::Test::UploadedFile.new("#{Rails.root}/spec/support/fixtures/test.jpg","image/jpg"),
               flgAsin: false,
               description: "descrição#{index}"
end

puts 'Reports created successfully'
