# rails g task dev setup
namespace :dev do
  desc "Inserts contacts into the database for testing"
  task setup: :environment do
    puts "Registering contacts..."

    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.aexitgo)
      )
    end

    puts "Successfully registered contacts!"
  end
end
