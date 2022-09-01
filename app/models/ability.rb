class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can %i[read create], :all
    can :destroy, Recipe, user: user
    can :destroy, Food, user: user
    can :destroy, RecipeFood
    return unless user.admin?

    can :manage, :all
  end
end
