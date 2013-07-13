class Mineral < ActiveRecord::Base
  attr_accessible :name, :type_id
  
  validates :name,    :presence => true
  validates :type_id, :presence => true, numericality: { only_integer: true }
end
