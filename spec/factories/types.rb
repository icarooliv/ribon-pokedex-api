FactoryBot.define do
    factory :type do
        name { Faker::Games::Pokemon.unique.name }
    end
end
  