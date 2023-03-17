class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    if user.role == 'admin'
      can :manage, :all
    else
      can :read, :all
      can :destroy, Post, user_id: user.id
      can :destroy, Comment, user_id: user.id
      can :create, [Post, Comment]
    end
  end
end