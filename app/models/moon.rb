class Moon < ActiveRecord::Base
  attr_accessible :celestial_id, :location_id, :name
  
  validates :name,          :presence => true
  validates :celestial_id,  :presence => true, numericality: { only_integer: true }
  validates :location_id,   :presence => true, numericality: { only_integer: true }
end
