class Ability
  include CanCan::Ability

  def initialize(current_user)
    @user = current_user || User.new

    if @user.admin?
      can :manage, :all
    else

      can :read, Comment
      can %i[delete destroy], Comment, user_id: @user.id
      can %i[delete destroy create], Post, author_id: @user.id

      can :read, Post
      can :create, Comment
    end
  end
end
