require 'controller_modules/profile_info_require_login'

class EducationInfosController < ApplicationController
  include ControllerModules::ProfileInfoRequireLogin
  private :require_login, :require_login_for_delete

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

  def permitted_params
    params.require(:education).permit(:from, :to, :school, :remark)
  end
end
