class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_attribute?(:admin)
      can :manage, :all
    elsif user.has_attribute?(:user)
      can :manage, :all
    elsif user.has_attribute?(:guest)
      can :manage, :all
    end
  end
end