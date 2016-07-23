class Admin::UsersController < Admin::ApplicationController

  def index
    @users = User.all.page(params[:page]).per(2)
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
      session[:user_id] = @user.id
      # same session, user can log in directly. aka: auto log in
      redirect_to movies_path,
        notice: "Welcome aboard, #{@user.firstname}!"
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



protected

  def user_params
    params.require(:user).
       permit(:email, :firstname, :lastname, :password,
              :password_confirmation, :admin, :temp_pw)
  end
end
