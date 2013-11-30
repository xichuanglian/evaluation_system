class StudentsController < ApplicationController
  layout "application"
  before_action :require_login

  def index
    @current[:index] = True
  end

  def profile
    @current[:profile] = True
  end

  def forms
    @current[:forms] = True
  end

  private

  def require_login
    @user = session[:user] && Student.find(session[:user])
    unless @user && @user.id == params[:id]
      redirect_to root_path
    end
    @current = Hash.new
  end

end
