class TeachersController < ApplicationController
  layout "application" 
  def show_students
    @users = (Teacher.find params[:id]).students
  end

  def comments
    @user = Teacher.find params[:id]
    @form = @user.get_form
  end

  def update
    @user = Teacher.find params[:id]
    @form = @user.get_form
    @form = EvaluationForm.update(@form.id, form_params)
    flash[:notice] = 'Successfully saved.'
    redirect_to teacher_show_students_path
  end
  private
  def form_params
    params.require(:form).permit(:preliminary_exam,
     :oral_exam,
     :thesis_proposal,
     :education,
     :classes_taken,
     :publications,
     :academic_activities,
     :research_progress,
     :plan,
     :suggestions,
     :comments,
     :grade,
     :comment_submitted)
  end
  def require_login
    @user = session[:user] && Teacher.find(session[:user])
    unless @user && @user.id == params[:id]
      redirect_to root_path
    end
    #@current = Hash.new
  end
end
