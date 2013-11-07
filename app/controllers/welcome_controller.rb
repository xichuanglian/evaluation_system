class WelcomeController < ApplicationController
  def index
    if session[:user]
      redirect_to user_index(session[:user]) and return
    end
  end

  def login
    user = User.verify(params[:username], params[:password])
    if user
      session[:user] = user
      redirect_to user_index(user) and return
    else
      flash[:error] = "Invalid username or passowrd!"
      redirect_to root_path and return
    end
  end

  def logout
    session[:user] = nil
    redirect_to root_path
  end

  private

  def user_index(user)
    student_form_path
  end
end