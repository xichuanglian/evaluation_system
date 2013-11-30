require "uri"
require "net/http"

class WelcomeController < ApplicationController
  layout "application"

  def index
    if session[:user]
      if session[:user_type] == :student
        redirect_to students_index_path(id: session[:user]) and return
      elsif session[:user_type] == :teacher
        redirect_to teachers_index_path(id: session[:user]) and return
      end
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
      xm = /:xm=([^:]+):/.match(response)[1]
      email = /:email(.+)\Z/.match(response)[1]
      student = Student.find_by(jobid: jobid)
      teacher = Teacher.find_by(jobid: jobid)
      if student
        student.name = xm
        student.email = email
        student.save!
        session[:user] = student.id
        session[:user_type] = :student
        redirect_to user_index(student) and return
      elsif teacher
        teacher.name = xm
        teacher.email = email
        teacher.save!
        session[:user] = teacher.id
        session[:user_type] = :teacher
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
    self.send((user.class.to_s.downcase + "s_index_path").to_sym, user)
  end
end
