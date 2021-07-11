class SetlistPermissionsController < ApplicationController

  PERMISSIONS = {
    :destroy => 0,
    :edit => 10,
    :view => 100
  }

  def index
    if params[:setlist_id] && @setlist = Setlist.find_by_id(params[:setlist_id])
      @setlist_permissions = @setlist.setlist_permissions
    else
      @setlist_permissions = SetlistPermission.all
    end
  end

  def edit
    @setlist_permission = SetlistPermission.find(params[:id])
    @user = @setlist_permission.user_email
    @permissions = PERMISSIONS
  end

  def update
    @setlist_permission = SetlistPermission.find(params[:id])
    @setlist = Setlist.find_by(:id => params[:setlist_permission][:setlist_id])
    user = User.find_by(:email => params[:setlist_permission][:user_email])
    @setlist_permission.user_id = user.id
    @setlist_permission.permission = params[:setlist_permission][:permission]
    @setlist_permission.save
    redirect_to setlist_setlist_permissions_path(@setlist)
  end

  def new
    @setlist_permission = SetlistPermission.new
  end

  def create 
    @user = User.find_by(:email => params[:user_email])
    if !@user
      flash[:message] = "No such user exists."
      redirect_to new_setlist_setlist_permission_path(params[:setlist_id])
    else
      @setlist_permission = SetlistPermission.create(
        :user_id => @user.id, 
        :permission => params[:permission], 
        :setlist_id => params[:setlist_id]
        )
        redirect_to setlist_setlist_permissions_path(params[:setlist_id])
    end
  end

  private
  def setlist_permission_params
    params.require(:setlist_permission).permit(
      :user_email,
      :permission,
      :setlist_id
    )
  end

end
