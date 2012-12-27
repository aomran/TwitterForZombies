class Weapon < ActiveRecord::Base
  belongs_to :zombie
  attr_accessible :damage, :weapon, :zombie_id
end
