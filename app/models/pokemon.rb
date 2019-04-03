class Pokemon < ApplicationRecord
  # extend ActsAsTree::TreeView

  has_many :evolutions, class_name: "Pokemon", foreign_key: :evolves_from
  belongs_to :ancestor, optional: true, class_name: "Pokemon", foreign_key: :evolves_from

  # acts_as_tree foreign_key: :evolves_from

  validates :name, presence: true
  validate :evolves_from_exists
  
  def as_json(opts = {})
    super(opts).merge(evolves_to: evolutions.as_json)
  end  

  def all_children(result = [])
    result.push([self])
    puts 'volta'
    if(!self.evolutions.empty?)
      child = self.evolutions.first
      child.all_children(result)
    end
      return result[0].flatten
  end

  def evolves_from_exists
    if self.evolves_from
      if !Pokemon.where(id: self.evolves_from).exists? then
          errors.add(:evolves_from, 'A valid evolves_from is needed.')
      end
    end
  end
end
