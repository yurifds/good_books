# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#user = User.create(name: ENV['username'], last_name: ENV['lastname'],
#  email: ENV['email'], password: ENV['password'],
#  password_confirmation: ENV['password_confirmation'], admin: true)

user = User.create(name: "usertest",last_name: "usertest",
  email:"usertest@gmail.com",password: "12345678",
  password_confirmation: "12345678", admin: true)

#50.times do |index|
#  Book.create! title: "PRACTICAL OBJECT-ORIENTED DESIGN IN RUBY#{index}",
#              author: "SANDI METZ#{index}",
#              ISBN: "978852092277#{index}", language: "Inglês",
#              image_book: Rack::Test::UploadedFile.new("#{Rails.root}/spec/support/fixtures/test.jpg","image/jpg"),
#              flgAsin: false,
#              description: "descrição#{index}",
#              user: user
#end
#
#puts 'Seed executed successfully'
