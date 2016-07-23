class Admin::UsersController < Admin::ApplicationController
  before_action :restrict_admin_access

  def index
    @users = User.all.page(params[:page]).per(2)
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to admin_user_path(@user)
    else
      render :edit
   end
  end



protected

  def user_params
    params.require(:user).
       permit(:email, :firstname, :lastname, :password,
              :password_confirmation, :admin, :temp_pw)
  end
end
