class Pokemon < ApplicationRecord
  has_many :evolutions, class_name: "Pokemon", foreign_key: :evolves_from
  belongs_to :ancestor, optional: true, class_name: "Pokemon", foreign_key: :evolves_from

  validates :name, presence: true
  validate :evolves_from_exists

  def to_node
    self.attributes.merge({:evolutions => self.evolutions.map { |evolution| evolution.to_node }})
  end
  
  def evolves_from_exists
    if self.evolves_from
      if !Pokemon.where(id: self.evolves_from).exists? then
          errors.add(:evolves_from, 'A valid evolves_from is needed.')
      end
    end
  end
end
