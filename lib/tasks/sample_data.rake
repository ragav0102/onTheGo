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
  end
end