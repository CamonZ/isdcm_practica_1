class UsersController < ApplicationController
  def index
    @user = User.new
  end

  def login
    @user = User.where(login: params[:user][:login]).first
    if !@user
      flash[:error] = "Este usuario no esta registrado"
    elsif @user.password != params[:user][:password]
      flash[:error] = "Tu clave es incorrecta"
    end
    if flash[:error].nil?
      redirect_to user_path(@user)
    else
      render template: 'users/index'
    end
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
