class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash["notice"] = "Name or password incorrect."
      redirect_to new_user_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to login_path
  end
end
