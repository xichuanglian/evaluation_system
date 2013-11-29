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
      xm = /:xm=(\w+):/.match(response)[1]
      email = /:email(.+)\Z/.match(response)[1]
      student = Student.find_by(jobid: jobid)
      teacher = Teacher.find_by(jobid: jobid)
      if student
        student.name = xm
        student.email = email
        session[:user] = student
        redirect_to user_index(student) and return
      elsif teacher
        teacher.name = xm
        teacher.email = email
        session[:user] = teacher
        redirect_to user_index(teacher) and return
      else
        flash[:error] = "You are not in our database. " +
          "Please contact administrator if you have any questions."
        redirect_to root_path and return
      end
    end
  end

  private

  def user_index(user)
    self.send((user.class.to_s + "s_index_path").to_sym)
  end
end
