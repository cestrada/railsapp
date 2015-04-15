class Ability
  include CanCan::Ability

    def initialize(user)
      user ||= User.new # in case of guest
      #alias_action :create, :read, :update, :destroy, :to => :crud
      if user.role_id == 1
        can :manage, :all
      else
      	can :read, :all
      end
    end

end