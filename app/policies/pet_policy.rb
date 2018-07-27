class PetPolicy < ApplicationPolicy
  def index?
    false
  end

  def show?
    false
  end
  
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
