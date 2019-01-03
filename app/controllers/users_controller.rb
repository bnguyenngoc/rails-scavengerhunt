# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    #     if User.exists?(email: @user.email)
    #       flash[:danger] = "Account with email already exists"
    #       redirect_to '/signup'
    #     end
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to '/signup'
    end
  end

  def edit
    @user = User.find(params[:id])
    authorize @user, policy_class: UserPolicy
  end

  def update
    @user = User.find(session[:user_id])
    authorize @user
    if @user.update_attributes(user_params)
      flash[:success] = 'User updated Successfully'
      redirect_to root_path
    else
      flash[:danger] = 'Error updating user'
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
