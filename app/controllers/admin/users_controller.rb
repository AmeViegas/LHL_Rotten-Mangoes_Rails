class Admin::UsersController < Admin::ApplicationController


  def index
    @users = User.all.page(params[:page]).per(10)
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
    if @user.save

      redirect_to admin_users_path(current_user),
        notice: "New user created!"
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to admin_user_path(@user)
    else
      render :edit
   end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path(current_user),
      notice: "User deleted!"
  end

protected

  def user_params
    params.require(:user).
       permit(:email, :firstname, :lastname, :password,
              :password_confirmation, :admin, :temp_pw)
  end
end
