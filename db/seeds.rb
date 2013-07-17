# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'SEED Moon Minerals'
m = Mineral.find_or_create_by_name :name => 'Atmospheric Gases', :type_id => 16634
puts "mineral: #{m.name} ID=#{m.type_id}"

m = Mineral.find_or_create_by_name :name => 'Cadmium', :type_id => 16643
puts "mineral: #{m.name} ID=#{m.type_id}"

m = Mineral.find_or_create_by_name :name => 'Caesium', :type_id => 16647
puts "mineral: #{m.name} ID=#{m.type_id}"

m = Mineral.find_or_create_by_name :name => 'Chromium', :type_id => 16641
puts "mineral: #{m.name} ID=#{m.type_id}"

m = Mineral.find_or_create_by_name :name => 'Cobalt', :type_id => 16640
puts "mineral: #{m.name} ID=#{m.type_id}"

m = Mineral.find_or_create_by_name :name => 'Dysprosium', :type_id => 16650
puts "mineral: #{m.name} ID=#{m.type_id}"

m = Mineral.find_or_create_by_name :name => 'Evaporite Deposits', :type_id => 16635
puts "mineral: #{m.name} ID=#{m.type_id}"

m = Mineral.find_or_create_by_name :name => 'Hafnium', :type_id => 16648
puts "mineral: #{m.name} ID=#{m.type_id}"

m = Mineral.find_or_create_by_name :name => 'Hydrocarbons', :type_id => 16633
puts "mineral: #{m.name} ID=#{m.type_id}"

m = Mineral.find_or_create_by_name :name => 'Mercury', :type_id => 16646
puts "mineral: #{m.name} ID=#{m.type_id}"

m = Mineral.find_or_create_by_name :name => 'Neodymium', :type_id => 16651
puts "mineral: #{m.name} ID=#{m.type_id}"

m = Mineral.find_or_create_by_name :name => 'Platinum', :type_id => 16644
puts "mineral: #{m.name} ID=#{m.type_id}"

m = Mineral.find_or_create_by_name :name => 'Promethium', :type_id => 16652
puts "mineral: #{m.name} ID=#{m.type_id}"

m = Mineral.find_or_create_by_name :name => 'Scandium', :type_id => 16639
puts "mineral: #{m.name} ID=#{m.type_id}"

m = Mineral.find_or_create_by_name :name => 'Silicates', :type_id => 16636
puts "mineral: #{m.name} ID=#{m.type_id}"

m = Mineral.find_or_create_by_name :name => 'Technetium', :type_id => 16649
puts "mineral: #{m.name} ID=#{m.type_id}"

m = Mineral.find_or_create_by_name :name => 'Thulium', :type_id => 16653
puts "mineral: #{m.name} ID=#{m.type_id}"

m = Mineral.find_or_create_by_name :name => 'Titanium', :type_id => 16638
puts "mineral: #{m.name} ID=#{m.type_id}"

m = Mineral.find_or_create_by_name :name => 'Tungsten', :type_id => 16637
puts "mineral: #{m.name} ID=#{m.type_id}"

m = Mineral.find_or_create_by_name :name => 'Vanadium', :type_id => 16642
puts "mineral: #{m.name} ID=#{m.type_id}"
