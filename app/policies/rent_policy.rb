class RentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # scope.where(user: user)
    end
  end

  def show?
    record.user == user || record.droid.user == user
  end

  def create?
    true
  end

  def destroy?
    record.user == user || record.droid.user == user
  end
end
