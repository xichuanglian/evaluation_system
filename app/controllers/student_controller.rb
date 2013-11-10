class StudentController < ApplicationController
  def form
    if session[:user] == nil
      redirect_to root_path and return
    end
    @student = session[:user]
    @form = EvaluationForm.find_by student_id: @student.jobid
    if @form && (@form.form_submitted == true || @form.form_submitted == "t")
      redirect_to form_path(@form) and return
    end
  end

  def save
    form_hash = params[:form]
    form = EvaluationForm.find_by student_id: params[:student][:jobid]
    if params[:form][:form_submitted]
      form_hash[:form_submitted] = true
    end
    if form
      form.update permit_params form_hash
    else
      form_hash[:student_id] = params[:student][:jobid]
      EvaluationForm.create(permit_params form_hash)
    end
    redirect_to student_form_path
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
      :grade,
      :form_submitted
    )
  end
end