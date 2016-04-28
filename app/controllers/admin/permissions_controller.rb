class Admin::PermissionsController < ApplicationController
  #display permissions
  def index
    if policy(User).permissions?
      render json: User.all.map {|user| user.permission_details}
    else
      permission_denied
    end
  end

  def show
    if policy(User).permissions?
      render json: User.find_by_id(params[:id]).try(:permission_details)
    else
      permission_denied
    end
  end

  def update
    if policy(User).update_permissions?
      @user = User.find_by_id params[:id]
      @user.update_permission(params[:model], params[:operation], params[:value])
      render json: @user.permission_details
    else
      permission_denied
    end
  end
end
