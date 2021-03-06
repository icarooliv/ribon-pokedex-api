FactoryBot.define do
    factory :pokemon do
        name { Faker::Games::Pokemon.unique.name }
        sprite_front_url { Faker::Lorem.word }
    end
end
  