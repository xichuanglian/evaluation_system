require 'controller_modules/profile_info_require_login'

class PublicationInfosController < ApplicationController
  include ControllerModules::ProfileInfoRequireLogin
  private :require_login, :require_login_for_delete

  before_action :require_login, only: [:new]
  before_action :require_login_for_delete, only: [:delete]

  def new
    publication_info = PublicationInfo.create!(permitted_params)
    @profile.publication_infos << publication_info
    @profile.save!
    redirect_to students_profile_path @user
  end

  def delete
    @publication_info = PublicationInfo.where(id: params[:id].to_i).first
    if @publication_info
      @publication_info.destroy
    end
    redirect_to students_profile_path @user
  end

  private

  def permitted_params
    params.require(:publication).permit(:title, :co_authors, :pub_type,
                                        :name, :year, :form, :remark)
  end
end
