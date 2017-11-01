class UsersController < ApplicationController

  def index
    @users = User.all - [current_user]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render :edit
    end
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.update_attributes(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit!
  end
end
