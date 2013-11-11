class EvaluationFormsController < ApplicationController
  layout "application" 
  def show
    @form = EvaluationForm.find params[:id]
    @student = User.find_by(jobid: @form.student_id)
  end
end
