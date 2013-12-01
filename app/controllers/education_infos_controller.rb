class EducationInfosController < ApplicationController
  before_action :require_login, only: [:new]
  before_action :require_login_for_delete, only: [:delete]

  def new
    education_info = EducationInfo.create!(permitted_params)
    @profile.education_infos << education_info
    @profile.save!
    redirect_to students_profile_path @user
  end

  def delete
    @education_info = EducationInfo.where(id: params[:id].to_i).first
    if @education_info
      @education_info.destroy
    end
    redirect_to students_profile_path @user
  end

  private

  def require_login
    @user = session[:user] && Student.find(session[:user])
    unless @user && @user.student_profile.id == params[:id].to_i
      redirect_to root_path
    end
    @profile = @user.student_profile
  end

  def require_login_for_delete
    @user = session[:user] && Student.find(session[:user])
    unless @user
      redirect_to root_path
    end
  end

  def permitted_params
    params.require(:education).permit(:from, :to, :school, :remark)
  end
end
