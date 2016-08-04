namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "ragav",
                 email: "ragavh123@gmail.com",
                 phone: "9894172765",
                 password: "foobar",
                 password_confirmation: "foobar")
    admin.toggle!(:admin)

    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@onthego.in"
      phone = "989410040#{n}"
      password  = "foobar"
      User.create!(name: name,
                   email: email,
                   phone: phone,
                   password: password,
                   password_confirmation: password)
    end
    users = User.all(limit: 6)
    5.times do |n|
      name = "House-#{n}"
      address = Faker::Lorem.sentence(5),
      max_guests = 2
      cd = 1000
      users.each { |user| user.houses.create!(name: name, address: address, max_guests: max_guests, Charge_day: cd, availability: true) }
    end

  end
end