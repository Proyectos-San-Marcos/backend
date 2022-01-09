class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(id: user.id)
      end
    end
  end

  def show?
    user.admin? || record.id == user.id
  end

  def create?
    true
  end

  def update?
    user.admin? || record.id == user.id
  end

  def destroy?
    user.admin? || record.id == user.id
  end
end
