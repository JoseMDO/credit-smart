class UserTransactionPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(owner_id: user.id)
    end
  end

  attr_reader :user, :user_transaction

  def initialize(user, user_transaction)
    @user = user
    @user_transaction = user_transaction
  end

  def index?
    true
  end

  def show?
    user.id == user_transaction.owner_id
  end

  def create?
    true
  end

  def new?
    true
  end

  def update?
    show?
  end

  def edit?
    show?
  end

  def destroy?
    show?
  end
end
