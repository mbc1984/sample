namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "test",
                         email: "test@test.test.com",
                         password: "1234567",
                         password_confirmation: "1234567")
    admin.toggle!(:admin)

    49.times do |n|
      name  = Faker::Name.name
      email = "test-#{n+1}@test.com"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end