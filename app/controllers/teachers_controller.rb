class TeachersController < ApplicationController
  layout "teachers"
  before_action :require_login

  def index
  end
  def sendmail
    student = Student.find params[:student]
    recipient = student.email #"yangchengych_ok@126.com"
    Emailer.remind(recipient).deliver
    #return if request.xhr?
    redirect_to teachers_index_path
    #render :text => 'Message sent successfully'
  end 
  def students_list
    @users = (Teacher.find params[:id]).students
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

  def require_login
    @user = session[:user] && Teacher.find(session[:user])
    unless @user && @user.id == params[:id].to_i
      redirect_to root_path
    end
    #@current = Hash.new
  end
end
