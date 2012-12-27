class Assignment < ActiveRecord::Base
	belongs_to :zombie
	belongs_to :role
  attr_accessible :role_id, :zombie_id
end
