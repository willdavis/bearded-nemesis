class Report
  # ActiveModel plumbing to make `form_for` work
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations
  
  # ActiveModel support
  def persisted?; false; end
  
  ATTRIBUTES = [:celestial_id, :location_id, :location_name, :moon_name, :mineral_name_1, :mineral_name_2, :mineral_name_3, :mineral_name_4]
  attr_accessor *ATTRIBUTES
  
  def initialize(attributes = {})
    ATTRIBUTES.each do |attribute|
      send("#{attribute}=", attributes[attribute])
    end
  end
  
  validate do
    unless moon.valid?
      moon.errors.each do |key, values|
        errors[key] = values
      end
    end
    
    minerals.each do |object|
      unless object.valid?
        object.errors.each do |key, values|
          errors[key] = values
        end
      end
    end
  end
  
  def save
    return false unless valid?
    
    minerals.push(mineral(mineral_name_1)) unless mineral_name_1.empty?
    minerals.push(mineral(mineral_name_2)) unless mineral_name_2.empty?
    minerals.push(mineral(mineral_name_3)) unless mineral_name_3.empty?
    minerals.push(mineral(mineral_name_4)) unless mineral_name_4.empty?
    
    #Save the report
    if create_objects
      true
    else
      false
    end
  end
  
  def moon
    @moon ||= Moon.new(
      :celestial_id => celestial_id,
      :location_id => location_id,
      :name => moon_name
    )
  end
  
  def minerals
    @minerals ||= []
  end
  
  def mineral(id)
    Mineral.find(id)
  end
  
  private
  
  def create_objects
    ActiveRecord::Base.transaction do
      moon.save!
      
      minerals.each do |mineral|
        moon.minerals << mineral
      end
    end
  rescue
    false
  end
end
