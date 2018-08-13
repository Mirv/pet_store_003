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
  
  def edit?
    update?
  end
  
  def update?
    if @user 
      # byebug
      result = record.user_id == user.id || user.admin
    else
      false
    end
  end

  
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
