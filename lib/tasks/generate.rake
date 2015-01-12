namespace :data do
  desc "Fill Database with values"
  task generate: :environment do
    require 'populator'
    require 'faker'
    User.populate 20 do |user|
      user.name = Faker::Name.name
      user.username = Faker::Internet.user_name
      user.email = Faker::Internet.email
      user.encrypted_password = User.new(password: "password").encrypted_password
      user.sign_in_count = 0
      user.about = Faker::Lorem.sentence(word_count = 20, supplemental = false, random_words_to_add = 10)
    end
  end
end
