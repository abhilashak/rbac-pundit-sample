class UserPolicy < ApplicationPolicy
  def permissions?
    user.admin?
  end

  def update_permissions?
    user.admin?
  end
end
