class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    @message = params[:message] if params[:message]
    @message ||= false
    render :show
  end

  def get_json
    render :json => @user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to user_path(@user), notice: "Welcome to the Employee Portal!" }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to :html, :js
    if @user.update(user_params)
      render partial: 'greeting'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(
        :name,
        :password,
        :admin
      )
    end
end
