class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    else
      can :read, :all
      can :manage, Album do |album|
        album.user == user
      end
      can :manage, Photo do |photo|
        photo.album.user == user
      end
    end
  end
end