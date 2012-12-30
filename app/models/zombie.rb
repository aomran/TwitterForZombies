class Zombie < ActiveRecord::Base
  has_one :brain, dependent: :destroy
  has_many :assignments
  has_many :tweets, dependent: :destroy
  has_many :roles, through: :assignments
  
  validates :age, :numericality => { :only_integer => true }
  validates :name, :presence => true
  attr_accessible :age, :bio, :name, :email, :decomp

  scope :rotting, where(rotting: true)
  scope :fresh, where("age < 20")
  scope :recent, order("created_at desc").limit(3)

  before_save :make_rotting
  def make_rotting
  	self.rotting = true if age > 20
  end
 
  def role_names
   @role_names_list = []
   self.roles.each { |role| @role_names_list << role.title}
   return @role_names_list
  end
  
  after_save :email_change_notification, if: :email_changed?

  private

  def email_change_notification
    ZombieMailer.email_change(self).deliver
  end

  
end
