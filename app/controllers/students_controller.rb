class StudentsController < ApplicationController
  layout "students"
  before_action :require_login

  def index
  end

  def profile
    @user.student_profile ||= StudentProfile.new(preliminary_exam_subject: "N/A",
                                                 preliminary_exam_score: 0,
                                                 oral_exam: "N/A",
                                                 thesis_proposal: "N/A")
    @profile = @user.student_profile
    @user.save!
    @education_infos = @profile.education_infos
    @classes_taken_infos = @profile.classes_taken_infos
    @publication_infos = @profile.publication_infos
    @academic_activity_infos = @profile.academic_activity_infos
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
