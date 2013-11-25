require "uri"
require "net/http"

class WelcomeController < ApplicationController
  layout "application" 

  def index
    if session[:user]
      redirect_to user_index(session[:user]) and return
    else
      render 'index'
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
    session.clear
    redirect_to root_path
  end

  def new_login
    ticket = params[:ticket]
    ip = request.remote_ip.gsub(/[.]/, '_')
    if Settings.ip
        ip = Settings.ip
    end
    response = Net::HTTP.get(URI.parse(Settings.ticket_url + "#{ticket}/#{ip}"))
    if response == "" || /code=1/.match(response)
      flash[:notice] = "Login Failed"
      redirect_to root_path and return
    else
      jobid = /zjh=(\d+)/.match(response)[1]
      user = User.find_by(jobid: jobid)
      session[:user] = user
      redirect_to user_index(user) and return
    end
  end

  private

  def user_index(user)
    student_form_path
  end
end
