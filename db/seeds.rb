# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

building_type = FactoryGirl.create :option_type, value: 'building_types'

FactoryGirl.create :option, option_type_id: building_type.id, value: 'Wood cutter',
  rpmA: 1.0, rpmB: 1.0, rpmC: 1.0, rpmD: 1.0, rpmE: 1.0, modifier: 0.1

FactoryGirl.create :option, option_type_id: building_type.id, value: 'Stoned mason',
  rpmA: 2.0, rpmB: 0.5, rpmC: 0, rpmD: 0, rpmE: 0, modifier: 0.2

FactoryGirl.create :option, option_type_id: building_type.id, value: 'Toolshop',
  rpmA: 1.0, rpmB: 1.0, rpmC: 1.0, rpmD: 1.0, rpmE: 1.0, modifier: 0.1

FactoryGirl.create :option, option_type_id: building_type.id, value: 'Coffeeshop',
  rpmA: 1.0, rpmB: 1.0, rpmC: 1.0, rpmD: 1.0, rpmE: 1.0, modifier: 0.1

FactoryGirl.create :option, option_type_id: building_type.id, value: 'Grainmill',
  rpmA: 1.0, rpmB: 1.0, rpmC: 1.0, rpmD: 1.0, rpmE: 1.0, modifier: 0.1
