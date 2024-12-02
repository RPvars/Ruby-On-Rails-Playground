class UsersController < ApplicationController
  def index
    @users = UserDecorator.decorate_collection(User.all)
  end

  def show
    @user = User.find(params[:id])
    @decorated_user = UserDecorator.new(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:name, :surname, :email, :phone, :country, :city, :street)
  end
end