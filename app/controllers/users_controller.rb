class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

  def new
    @user = RegularUser.new
  end

  def create
    @user = RegularUser.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render action: 'new'
    end
  end

  def show
    @user = current_user
  end

  def edit
    @user = RegularUser.find(current_user.id)
  end

  def update
    @user = RegularUser.find(current_user.id)
    if @user.update_attributes(user_params)
      redirect_to root_path
    else
      render action: 'edit'
    end
  end


  private
    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation)
    end
end
