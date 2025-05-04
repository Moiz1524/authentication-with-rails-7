class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if user = User.authenticate_by(email: params[:email], password: params[:password])
      login user
      redirect_to(root_path, notice: "You have signed in successfully.")
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def destroy
    logout current_user
    redirect_to(root_path, notice: "You have been logged out.")
  end
end