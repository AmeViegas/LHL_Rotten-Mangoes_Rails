class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      # binding.pry
      # if user.temp_pw
      #   redirect_to edit_user_path(user)
      # else
        redirect_to movies_path, notice: "Welcome back, #{user.firstname}!"
      # end
    else
      flash.now[:alert] = "Log in failed..."
      render :new
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to movies_path, notice: "Adios!"
  end

end
