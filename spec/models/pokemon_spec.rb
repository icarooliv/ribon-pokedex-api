require 'rails_helper'

RSpec.describe Pokemon, type: :model do
    it { should validate_presence_of(:name) }
    it {should validate_presence_of(:sprite_front_url)}
    it { should have_many(:evolutions) }
    it { should belong_to(:ancestor) }
    it {should have_and_belong_to_many(:types)}
end
  