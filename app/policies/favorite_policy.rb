class FavoritePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user_id: user.id)
    end
  end

  attr_reader :user, :favorite

  def initialize(user, favorite)
    @user = user
    @favorite = favorite
  end

  def create?
    true
  end

  def index?
    true
  end

  def destroy?
    favorite.user.id == user.id
  end

end
