class StudentsController < ApplicationController
  layout "students"
  before_action :require_login

  def index
  end

  def profile
  end

  def forms
  end

  private

  def require_login
    @user = session[:user] && Student.find(session[:user])
    unless @user && @user.id == params[:id].to_i
      redirect_to root_path
    end
  end

end
