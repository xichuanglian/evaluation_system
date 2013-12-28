class TeachersController < ApplicationController
  layout "teachers"
  before_action :require_login

  def index
    @usage = Usage.find_by(:name=>'TeacherUsage')
  end
  def sendmail
    student = Student.find params[:student]
    recipient = student.email
    Emailer.remind(recipient).deliver
    #return if request.xhr?
    redirect_to teachers_students_list_path
    #render :text => 'Message sent successfully'
  end 
  def students_list
    @users = (Teacher.find params[:id]).students
  end
  def view_form
    @form = EvaluationForm.find params[:form_id]
  end
  def to_comment_list
    @list = []
    @users = (Teacher.find params[:id]).students
    @users.each do |user|
      user.filled_forms.each do |form|
        if form && form.teacher.id==params[:id].to_i && form.form_submitted && !form.comment_submitted
          @list<<form
        end
      end
    end
  end

  def commented_list
    @list = []
    @templist = @user.commented_forms
    @templist.each do |form|
      if form && form.form_submitted && form.comment_submitted
        @list<<form
      end
    end
  end
  def students_form_list
    @list = []
    @users = (Teacher.find params[:id]).students
    @users.each do |user|
      user.filled_forms.each do |form|
        if form && form.form_submitted && form.comment_submitted
          @list<<form
        end
      end
    end
  end

  def comments
    @form = EvaluationForm.find params[:form_id]
  end

  def update
    @form = EvaluationForm.find params[:form_id]
    #@form.comments = 
    @form.update(permitted_params)
    flash[:notice] = 'Successfully saved.'
    redirect_to teachers_to_comment_list_path
  end

  private

  def require_login
    @user = session[:user] && Teacher.find(session[:user])
    unless @user && @user.id == params[:id].to_i
      redirect_to root_path and return
    end
    if @user.admin
      @is_admin = true
    else
      @is_admin = false
    end
    #@current = Hash.new
  end

  def permitted_params
    params.require(:comment).permit(:comments, :grade, :comment_submitted)
  end
end
