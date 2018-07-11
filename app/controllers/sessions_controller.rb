class SessionsController < ApplicationController

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  def new
    @user = User.new
    @users = User.all
  end

  def create
    if auth_hash = request.env["omniauth.auth"]
      # oauth_name = auth_hash["info"]["name"]
      @user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id] = @user.id
      redirect_to user_path(@user.id), notice: "Welcome back to Employee Services!"
    else
      @user ||= User.find_by(name: params[:user][:name])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user.id), notice: "Welcome back to Employee Services!"
      else
        redirect_to signin_path
      end
    end
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
