class UsersController < ApplicationController
  before_action :redirect_if_authenticated, only: [:create, :new]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  def create
    @user = User.new(create_user_params)
    if @user.save
      @user.send_confirmation_email!
      redirect_to root_path, notice: 'Please check your email (and spam folder) for confirmation instructions'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.authenticate(params[:user][:current_password])
      if @user.update(update_user_params)
        if params[:user][:unconfirmed_email].present?
          @user.send_confirmation_email!
          redirect_to root_path, notice: 'Check your email for confirmation instructions.'
        else
          redirect_to root_path, notice: 'Account updated'
        end
      else
        render :edit, status: :unprocessable_entity
      end
    else
      flash.now[:error] = 'Incorrect password'
      render :edit, status: :unprocessable_entity
    end
  end

  private

#  def user_params
#    params.require(:user).permit(:email, :password, :password_confirmation)
#  end

  def create_user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def update_user_params
    params.require(:user).permit(:unconfirmed_email, :current_password, :password, :password_confirmation)
  end
end
