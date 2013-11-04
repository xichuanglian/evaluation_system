class WelcomeController < ApplicationController
  def index
  end

  def login
  	user = User.verify(params[:username], params[:password])
  	if user
  		session[:user] = user
    	redirect_to student_form_path
    else
    	flash[:error] = "Invalid username or passowrd!"
    	render :index
    end
  end
end
