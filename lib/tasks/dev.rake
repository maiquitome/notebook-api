# rails g task dev setup
namespace :dev do
  desc "Inserts data into the database for testing"

  task setup: :environment do
    puts "Registering kinds of contacts..."
    kinds = %w(Amigo Comercial Conhecido)
    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end
    puts "Successfully registered kinds!"

    puts "Registering contacts..."
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      )
    end
    puts "Successfully registered contacts!"
  end
end
