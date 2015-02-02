class City < ActiveRecord::Base
  belongs_to :player

  has_many :buildings
end