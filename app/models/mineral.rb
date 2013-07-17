class Mineral < ActiveRecord::Base
  attr_accessible :name, :type_id
  
  has_and_belongs_to_many :moons
  
  validates :name,    :presence => true, :uniqueness => true
  validates :type_id, :presence => true, numericality: { only_integer: true }, :uniqueness => true
end
