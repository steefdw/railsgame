class Player < ActiveRecord::Base
  has_many :buildings, through: :cities
  has_may :cities
end