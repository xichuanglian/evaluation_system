class EvaluationFormsController < ApplicationController
  layout "application"
  def show
    @form = EvaluationForm.find params[:id]
    @student = User.find_by(jobid: @form.student_id)
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
end
