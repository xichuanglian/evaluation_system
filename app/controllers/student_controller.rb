class StudentController < ApplicationController
  def form
    @student = session[:user]
  end

  def submit
    form_hash = params[:form]
    form_hash[:student_id] = params[:student][:jobid]
    form = EvaluationForm.create(permit_params form_hash)
    redirect_to root_path
  end

  private

  def permit_params(form_params)
    form_params.permit(
      :student_id,
      :preliminary_exam,
      :oral_exam,
      :thesis_proposal,
      :education,
      :classes_taken,
      :publications,
      :academic_activities,
      :researsh_progress,
      :plan,
      :suggestions,
      :comments,
      :grade
    )
  end
end