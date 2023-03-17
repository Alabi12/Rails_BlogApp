class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, :all

    if user.role == 'admin'
      can :manage, :all
    else
      can :destroy, Post do |post|
        post.user == user
      end
      can :destroy, Comment do |comment|
        comment.user == user
      end
    end
  end
end
