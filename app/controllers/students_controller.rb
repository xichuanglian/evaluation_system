class StudentsController < ApplicationController
  layout "application" 
  
  def form
    if session[:user] == nil
      redirect_to root_path and return
    end
    @student = session[:user]
    @form = EvaluationForm.find_by student_id: @student.jobid
    if @form && (@form.form_submitted == true || @form.form_submitted == "t")
      redirect_to form_path(@form) and return
    end
    @check_form = Hash.new("")
    if session[:missing]
      session[:missing].each do |x|
      #flash[:missing]#
        @check_form[x] = "error"
      end
    end
    session[:missing] = nil
  end

  def save
    form_hash = params[:form]
    form = EvaluationForm.find_by student_id: params[:student][:jobid]
    if params[:form][:form_submitted]
      missing = check(form_hash)
      if missing.size == 0
        form_hash[:form_submitted] = true
      else
        session[:missing] = missing
        form_hash[:form_submitted] = false
      end
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
  def check(h)
    keys = []
    h.keys.each do |key|
      if h[key.to_sym] && h[key.to_sym].to_s.size > 0
        keys.push key.to_sym
      end
    end
    EvaluationForm.required_fields - keys
  end

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
      :research_progress,
      :plan,
      :suggestions,
      :comments,
      :grade,
      :form_submitted
    )
  end
end
