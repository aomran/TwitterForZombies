class Tweet < ActiveRecord::Base
  belongs_to :zombie
  attr_accessible :status, :zombie_id, :zombie

end
