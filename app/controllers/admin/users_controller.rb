class Admin::UsersController < Admin::ApplicationController

  def index
    @users = User.all.page(params[:page]).per(2)
  end

  def show
    @user = User.find(params[:id])
  end

end
