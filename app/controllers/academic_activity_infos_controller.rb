require 'controller_modules/profile_info_require_login'

class AcademicActivityInfosController < ApplicationController
  include ControllerModules::ProfileInfoRequireLogin
  private :require_login, :require_login_for_delete

  before_action :require_login, only: [:new]
  before_action :require_login_for_delete, only: [:delete]

  def new
    academic_activity_info = AcademicActivityInfo.create!(permitted_params)
    @profile.academic_activity_infos << academic_activity_info
    @profile.save!
    redirect_to students_profile_path @user
  end

  def delete
    @academic_activity_info = AcademicActivityInfo.where(id: params[:id].to_i).first
    if @academic_activity_info
      @academic_activity_info.destroy
    end
    redirect_to students_profile_path @user
  end

  private

  def permitted_params
    params.require(:academic_activity).permit(:date, :activity_type, :details, :remark)
  end
end
