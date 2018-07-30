class LocationPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end
  
  def destroy?
    admin? # record.user_id == user.id || # for now just admin delete
  end
  
  def edit?
    update?
  end
  
  def update?
    if @user 
      result = admin? || record.user_id == user.id
    else
      false
    end
  end
  
  def admin?
    user.admin
  end
  
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
