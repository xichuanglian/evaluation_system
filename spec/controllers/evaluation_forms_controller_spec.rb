require 'spec_helper'

describe EvaluationFormsController do
  describe 'GET new' do
    before :each do
      @student = FactoryGirl.create(:student)
    end

    context "when student don't have a profile" do
      before :each do
        session[:user] = @student.id
      end
      it "should redirect to student profile path" do
        get :new
        flash[:notice].should_not be_nil
        response.should redirect_to(students_profile_path @student)
      end
    end

    context "when student have a profile" do
      before :each do
        @profile = FactoryGirl.create(:student_profile)
        @student = @profile.student
        session[:user] = @student.id
        get :new
      end

      it "should set the profile fields" do
        assigns(:form).student.should == @student
        assigns(:form).name.should == @student.name.to_s
        assigns(:form).student_jobid.should == @student.jobid.to_s
        assigns(:form).student_type.should == @student.student_type.to_s
        assigns(:form).year.should == @student.year
        assigns(:form).oral_exam.should == @profile.oral_exam.to_s
        assigns(:form).education.should == @profile.get_education_infos
      end

      it "should render new form view" do
        response.should render_template(:new)
      end
    end
  end

  describe 'POST create' do
    before :each do
      @profile = FactoryGirl.create(:student_profile)
      @student = @profile.student
      @teacher = @student.advisor
      @semester = FactoryGirl.create(:semester)
      session[:user] = @student.id
      form_hash = {
        name: "test name",
        student_jobid: "student id",
        education: "education info",
        form_submitted: false,
        semester: @semester.id
      }
      post :create, form: form_hash
    end

    it "should set student and teacher field in the form" do
      form = EvaluationForm.last
      form.student.should == @student
      form.teacher.should == @teacher
    end

    it "should set semester" do
      form = EvaluationForm.last
      form.semester.should == @semester
    end

    it "should redirect to students forms path" do
      response.should redirect_to(students_forms_path(@student))
    end
  end

  describe 'POST update' do
    before :each do
      @form = FactoryGirl.create(:evaluation_form)
      @student = @form.student
      @teacher = @form.teacher
      @semester = @form.semester
      session[:user] = @student.id
      @form_hash = {
        eduation: "test education info",
        publications: "test publication info",
        plan: "test plan",
        form_submitted: false
      }
      post :update, id: @form.id, form: @form_hash
    end

    it "should update form fields" do
      form = EvaluationForm.find(@form.id)
      form.education.should == @form_hash[:education]
      form.publications.should == @form_hash[:publications]
      form.plan.should == @form_hash[:plan]
    end

    it "should redirect to students forms path" do
      response.should redirect_to(students_forms_path @student)
    end
  end
end
