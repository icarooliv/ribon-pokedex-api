class Pokemon < ApplicationRecord
  belongs_to :pokemon, :foreign_key => "evolves_from", optional: true
  validates :name, presence: true
  validate :evolves_from_exists
  
  def evolves_from_exists
    if self.evolves_from
      if !Pokemon.where(id: self.evolves_from).exists? then
          errors.add(:evolves_from, 'A valid evolves_from is needed.')
      end
    end
  end
end
