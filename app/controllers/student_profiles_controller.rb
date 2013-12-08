class StudentProfilesController < ApplicationController
  before_action :require_login

  def preliminary_exam_update
    @profile.update params.require(:student_profile).permit(:preliminary_exam_subject, :preliminary_exam_score)
    redirect_to students_profile_path(@user)
  end

  def oral_exam_update
    @profile.update params.require(:student_profile).permit(:oral_exam)
    redirect_to students_profile_path(@user)
  end

  def thesis_proposal_update
    @profile.update params.require(:student_profile).permit(:thesis_proposal)
    redirect_to students_profile_path(@user)
  end

  private

  def require_login
    @user = session[:user] && Student.find(session[:user])
    unless @user && @user.student_profile.id == params[:id].to_i
      redirect_to root_path
    end
    @profile = @user.student_profile
  end

end
