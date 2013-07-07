class Ability
  include CanCan::Ability

  def initialize(zombie)
    #zombie is the user model with a "current_user" helper method
    zombie ||= Zombie.new #guest user(not logged in)
    can [:read, :update, :destroy], Zombie, :id => zombie.id
    can :create, Zombie
    can :read, Zombie
    can :manage, Tweet, :zombie => {:id => zombie.id}
    can :read, Tweet
    
# Nested resources: https://github.com/ryanb/cancan/wiki/Nested-Resources
    # Define abilities for the passed in user here. For example:
    #
    #    # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
