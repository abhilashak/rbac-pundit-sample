class User < ActiveRecord::Base
  def admin?; type == 'Admin'; end
  def participant?;type == 'Participant'; end
  #store_accessor :permissions

  def permission_details
    {
     'User': first_name,
     'Type': type,
     'Permissions': permissions
    }
  end

  def update_permission(model, operation, value)
    if eval(value)
      new_permissions = permissions_of(model) + [operation] unless permissions_of(model).include?(operation)
    else
      new_permissions = permissions_of(model) - [operation] if permissions_of(model).include?(operation)
    end
    permissions[model] = new_permissions
    save
  end

  def permissions_of(model)
    @perm ||= eval(permissions[model])
  end
end
