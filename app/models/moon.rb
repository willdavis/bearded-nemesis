class Moon < ActiveRecord::Base
  attr_accessible :celestial_id, :location_id, :name
  
  has_and_belongs_to_many :minerals
  belongs_to :user
  
  validates :name,          :presence => true, :uniqueness => true
  validates :celestial_id,  :presence => true, numericality: { only_integer: true }, :uniqueness => true
  validates :location_id,   :presence => true, numericality: { only_integer: true }
  
  def created_by
    @user ||= User.find(user_id)
  end
end
