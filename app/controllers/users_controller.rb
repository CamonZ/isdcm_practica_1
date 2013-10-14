class UsersController < ApplicationController
  def index
    
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(create_user_params)
    if @user.persisted?
      redirect_to user_path(@user)
    else
      render template: 'users/new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def create_user_params
    params.require(:user).permit(:name, :last_name, :email, :login, :password)
  end
end
