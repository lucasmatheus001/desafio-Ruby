class AccountPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def show?
      current_user.id == current_user.id
    end

    def destroy?
      user.id == record.user_id
    end
    

  end
end
