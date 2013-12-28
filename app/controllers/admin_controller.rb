class AdminController < ApplicationController
  layout "application" 
  #before_action :require_admin_login

  def index
    @usage = Usage.find_by(:name=>'AdminUsage')
  end

  def new_student

  end

  def new_teacher

  end

  def create_student
    @student = Student.create!(student_params)
    flash[:notice] = 'Successfully added a new student.'
    redirect_to admin_show_students_path
  end

  def create_teacher
    @teacher = Teacher.create!(teacher_params)
    flash[:notice] = 'Successfully added a new teacher.'
    redirect_to admin_show_teachers_path
  end


  def show_students
    @students = Student.all
  end

  def show_teachers
    @teachers = Teacher.all
  end

  def edit_student
    @student = Student.find params[:id]
    if @student.advisor != nil
      @student_advisor_id = @student.advisor.id
    end
    if @student.co_advisor != nil
      @student_co_advisor_id = @student.co_advisor.id
    end
    if @student.official_advisor != nil
      @student_official_advisor_id = @student.official_advisor.id
    end
    @teachers = Teacher.all
  end

  def edit_teacher
    @teacher = Teacher.find params[:id]
  end

  def update_student
    @student = Student.find params[:id]
    Student.update(@student.id, student_params.except(:advisor, :co_advisor, :official_advisor))
    @student.advisor = Teacher.find student_params[:advisor]
    if student_params[:co_advisor].to_i > 0
      @student.co_advisor = Teacher.find student_params[:co_advisor]
    else
      @student.co_advisor = nil
    end
    if student_params[:official_advisor].to_i > 0
      @student.official_advisor = Teacher.find student_params[:official_advisor]
    else
      @student.official_advisor = nil
    end
    @student.save
    flash[:notice] = 'Successfully saved.'
    redirect_to admin_show_students_path
  end

  def update_teacher
    @teacher = Teacher.find params[:id]
    Teacher.update(@teacher.id, teacher_params)
    flash[:notice] = 'Successfully saved.'
    redirect_to admin_show_teachers_path
  end


  def detail_student
    @student = Student.find params[:id]
    if @student.advisor != nil
      @student_advisor_name = @student.advisor.name
    end
    if @student.co_advisor != nil
      @student_co_advisor_name = @student.co_advisor.name
    end
    if @student.official_advisor != nil
      @student_official_advisor_name = @student.official_advisor.name
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :jobid, :email, :student_type,
      :advisor, :co_advisor, :official_advisor)
  end

  def teacher_params
    params.require(:teacher).permit(:name, :jobid, :email, :admin)
  end

  def require_admin_login
    @user = session[:user] && Teacher.find(session[:user])
    unless @user && @user.admin
      redirect_to root_path
    end
  end

end