class EvaluationFormsController < ApplicationController
  def new
    student = Student.find(session[:user])
    unless student.student_profile
      flash[:notice] = "You should create an profile first"
      redirect_to students_profile_path(student) and return
    end
    @form = EvaluationForm.new
    fill_form_for student
  end

  def create
    @form = EvaluationForm.create! permitted_params
    student = Student.find(session[:user])
    @form.semester = Semester.find params[:form][:semester]
    @form.student = student
    @form.teacher = student.advisor
    @form.save!
    redirect_to students_forms_path(student)
  end

  def update
    @form = EvaluationForm.find params[:id]
    student = Student.find(session[:user])
    @form.update_attributes!(permitted_params)
    redirect_to students_forms_path(student)
  end

  def pdf
    @form = EvaluationForm.find params[:id]
    @student = User.find_by(jobid: @form.student_id)
    template_file = File.join(Rails.root, "tmp/form_template.tex")
    tex_str = ""
    File.open(template_file, "r") do |file|
      tex_str = file.read.gsub(/%= ([^%]*) %/) do |s|
        eval($1).to_s
      end
    end
    pdf_file = File.join(Rails.root, "tmp/form_#{params[:id]}.pdf")
    tex_file = File.join(Rails.root, "tmp/form_#{params[:id]}.tex")
    temp_dir = File.join(Rails.root, "tmp")
    File.open(tex_file, 'w') { |file| file.write(tex_str) }
    #system("pandoc -o #{pdf_file} #{tex_file}")
    system("pdflatex -output-directory #{temp_dir} #{tex_file}")
    send_file(pdf_file, :filename => "evaluation_form.pdf", :type => "application/pdf")
  end

  private

  def fill_form_for student
    @form.student = student
    @form.name = student.name
    @form.student_jobid = student.jobid
    @form.student_type = student.student_type
    @form.year = student.year
    @form.thesis_advisor = student.advisor.name
    co_advisor = student.co_advisor
    @form.co_advisor = co_advisor.name if co_advisor
    official_advisor = student.official_advisor
    @form.official_advisor = official_advisor.name if official_advisor
    profile = student.student_profile
    @form.preliminary_exam = profile.preliminary_exam_to_string
    @form.oral_exam = profile.oral_exam
    @form.thesis_proposal = profile.thesis_proposal
    @form.education = profile.get_education_infos
    @form.classes_taken = profile.get_classes_taken_infos
    @form.publications = profile.get_publication_infos
    @form.academic_activities = profile.get_academic_activity_infos
  end

  def permitted_params
    params.require(:form).permit(:name, :student_jobid, :student_type,
                                 :year, :thesis_advisor, :co_advisor,
                                 :official_advisor, :preliminary_exam,
                                 :oral_exam, :thesis_proposal,
                                 :education, :classes_taken,
                                 :publications, :academic_activities,
                                 :research_progress, :plan, :suggestions,
                                 :form_submitted)
  end
end
