class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role == 'admin'
      can :manage, :all
    else
      can :manage, Album do |album|
        album.user == user
      end
      can :manage, Photo do |photo|
        photo.album.user == user
      end
      can :create, Comment
      cannot :manage, ActiveAdmin::Page, :name => "Dashboard"
      can :read, [Album, Photo, Comment, Relationship, Tag, User]
    end
  end
end
