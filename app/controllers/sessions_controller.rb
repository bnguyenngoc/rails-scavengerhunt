# frozen_string_literal: true

class SessionsController < ApplicationController

  def create
    user = User.find_by_email(params[:email])
    # If the user exists AND the password entered is correct.
    if user&.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_back(fallback_location: root_path)
    else
      flash[:warning] = "Wrong email or Password"
      # If user's login doesn't work, send them back to the login form.
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root
  end
end
