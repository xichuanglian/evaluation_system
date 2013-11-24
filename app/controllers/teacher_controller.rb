class TeacherController < ApplicationController
  layout "application" 
  def show_students
    @users = User.all
  end

  def comments
    @user = User.find params[:id]
    @form = @user.get_form
  end

  def update
    @user = User.find params[:id]
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
end