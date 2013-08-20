class Moon < ActiveRecord::Base
  attr_accessible :celestial_id, :location_id, :name, :updated_by_id
  
  has_and_belongs_to_many :minerals
  belongs_to :user
  
  validates :name,          :presence => true, :uniqueness => true
  validates :celestial_id,  :presence => true, numericality: { only_integer: true }, :uniqueness => true
  validates :location_id,   :presence => true, numericality: { only_integer: true }
  
  scope :by_location_id, lambda { |value| where("location_id = ?", value) if value }
  
  def created_by
    @submitter ||= User.find(user_id)
  end
  
  def updated_by
    @updater ||= User.find(updated_by_id)
  end
  
  def self.search(params)
    moons = Moon.order(:name)
                 .by_location_id(params[:location_id])
                 .page(params[:page])
  end
end
