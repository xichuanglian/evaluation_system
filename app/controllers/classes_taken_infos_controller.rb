require 'controller_modules/profile_info_require_login'

class ClassesTakenInfosController < ApplicationController
  include ControllerModules::ProfileInfoRequireLogin
  private :require_login, :require_login_for_delete

  before_action :require_login, only: [:new]
  before_action :require_login_for_delete, only: [:delete]

  def new
    classes_taken_info = ClassesTakenInfo.create!(permitted_params)
    @profile.classes_taken_infos << classes_taken_info
    @profile.save!
    redirect_to students_profile_path @user
  end

  def delete
    @classes_taken_info = ClassesTakenInfo.where(id: params[:id].to_i).first
    if @classes_taken_info
      @classes_taken_info.destroy
    end
    redirect_to students_profile_path @user
  end

  private

  def permitted_params
    params.require(:classes_taken).permit(:course_number,
                                          :name,
                                          :instructor,
                                          :time,
                                          :credits,
                                          :score,
                                          :remark)
  end
end
