class UsersController < ApplicationController
  def index
    @users = UserDecorator.decorate_collection(User.all)
  end

  def show
    @user = User.find(params[:id])
    @decorated_user = UserDecorator.new(@user)
    @presented_user = UserPresenter.new(@user)
  end

  def new
    @form = Users::Form.new
  end

  def create
    @form = Users::Form.new(user_params)
    if @form.save
      redirect_to users_path
    else
      render :new
    end
  end

  def user_params
    params.require(:users_form).permit(:name, :surname, :email, :phone, :country, :city, :street)
  end
end
