class Brain < ActiveRecord::Base
  belongs_to :zombie
  attr_accessible :flavor, :status, :zombie_id
end
