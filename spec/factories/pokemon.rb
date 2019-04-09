FactoryBot.define do
    factory :pokemon do
        name { Faker::Lorem.word }
        sprite_front_url { Faker::Games::Pokemon.name }
    end
end
  