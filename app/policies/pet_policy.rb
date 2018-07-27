class PetPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end
  
  def destroy?
    user.admin # record.user_id == user.id || # for now just admin delete
  end
  
  def update?
    record.user_id == user.id
  end
  
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
