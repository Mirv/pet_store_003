class PetCategoryPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end
  
  def destroy?
    admin? 
  end
  
  def edit?
    update?
  end
  
  def update?
    if @user 
      admin?
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
