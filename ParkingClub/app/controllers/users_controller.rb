class UsersController < ApplicationController

  before_action :require_login, except: [:new, :create, :new_owner]

  def new
    @user = User.new
  end

  def new_owner
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to root_path, notice: "Welcome, #{@user.first_name}!"
    else
      render :new, notice: "Something went wrong, try again"
    end
  end

  def show
    @user = User.find_by(params[:id])
    @memberships = current_user.memberships
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :owner, :password_confirmation)
  end

end
