# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  #   def authorize
  #     redirect_to '/login' unless current_user
  #   end

  private

  def user_not_authorized
    flash[:danger] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || root_path)
  end
end
