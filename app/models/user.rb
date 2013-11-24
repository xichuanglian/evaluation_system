class User < ActiveRecord::Base
  def self.verify(username, password)
    return self.find_by jobid: username
  end
  def get_students
    User.where(advisor: self.jobid)
  end
  def form_submitted
    form = EvaluationForm.find_by student_id: self.jobid
    if form && (form.form_submitted || form.form_submitted == "t")
      return "Yes"
    else
      return "No"
    end
  end
  def get_form
    form = EvaluationForm.find_by student_id: self.jobid
    if form && (form.form_submitted || form.form_submitted == "t")
      return form
    else
      return nil
    end
  end
  def submitted
    if self.get_form == nil 
      return 'N'
    elsif self.job == 'Student' && (self.get_form.form_submitted || self.get_form.form_submitted == "t")
      return 'Y'
    elsif self.job == 'Teacher' && (self.get_form.comment_submitted || self.get_form.comment_submitted == "t")
      return 'Y' 
    else
      return 'N'
    end
  end
end
