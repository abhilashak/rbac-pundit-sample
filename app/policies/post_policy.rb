class PostPolicy < ApplicationPolicy
  def update?
    eval(user.permissions[record.class.name]).include? 'update'
  end

  def create?
    eval(user.permissions[record.class.name]).include? 'create'
  end
end
