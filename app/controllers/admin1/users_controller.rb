class Admin::UsersController < ApplicationController
def index
  @users = User.all
end
def delete
    @user = User.find(params[:format])
    @user.destroy
    flash[:notice] = "user deleted"
    redirect_to admin_users_index_path
end

end
