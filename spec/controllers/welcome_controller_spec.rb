require "spec_helper"

describe WelcomeController do
  describe "GET index" do
    context "when user has logged in as student" do
      before :each do
        @user = mock_model("Student")
        session[:user] = @user
        session[:user_type] = :student
        get :index
      end

      it "should redirect to student's index page" do
        response.should redirect_to(students_index_path :id => @user.id)
      end
    end

    context "when user has logged in as teacher" do
      before :each do
        @user = mock_model("Teacher")
        session[:user] = @user
        session[:user_type] = :teacher
        get :index
      end

      it "should redirect to teacher's index page" do
        response.should redirect_to(teachers_index_path :id => @user.id)
      end
    end

    context "when user has not logged in" do
      before :each do
        session[:user] = nil
        get :index
      end

      it "should render index page" do
        response.should render_template("index")
      end
    end
  end

  describe "GET logout" do
    before :each do
      get :logout
    end

    it "should clear session" do
      session[:user].should be_nil
      session[:user_type].should be_nil
    end

    it "should redirect to index page" do
      response.should redirect_to(root_path)
    end
  end

  describe "GET new_login" do
    before :all do
      @student = FactoryGirl.create(:student)
      @teacher = @student.advisor
      @ticket = "2a3bdc280042af9213ac132e"
      @student_name = "New Student Name"
      @student_email = "new_student_email@mail.com"
      @teacher_name = "New Teacher Name"
      @teacher_email = "new_teacher_email@mail.com"
      @student_info = "code=0:zjh=#{@student.jobid}"\
      ":yhm=student_1:xm=#{@student_name}:yhlb=X0011"\
      ":dw=SaaS:email=#{@student_email}"
      @teacher_info = "code=0:zjh=#{@teacher.jobid}"\
      ":yhm=teacher_1:xm=#{@teacher_name}:yhlb=J0000"\
      ":dw=SaaS:email=#{@teacher_email}"
      @failed_info = "code=1"
    end

    it "should call get_user_info to get user_info" do
      controller.should_receive(:get_user_info).once.and_return("")
      get :new_login, :ticket => @ticket
    end

    context "when log in as teacher" do
      before :each do
        controller.stub(:get_user_info).and_return(@teacher_info)
        get :new_login, :ticket => @ticket
      end

      it "should update teacher's info" do
        teacher = Teacher.find_by(jobid: @teacher.jobid)
        teacher.should_not be_nil
        teacher.name.should eq @teacher_name
        teacher.email.should eq @teacher_email
      end

      it "should redirect to teacher's index path" do
        response.should redirect_to(teachers_index_path(@teacher))
      end
    end

    context "when log in as student" do
      before :each do
        controller.stub(:get_user_info).and_return(@student_info)
        get :new_login, :ticket => @ticket
      end

      it "should update student's info" do
        student = Student.find_by(jobid: @student.jobid)
        student.should_not be_nil
        student.name.should eq @student_name
        student.email.should eq @student_email
      end

      it "should redirect to student's index page" do
        response.should redirect_to(students_index_path(@student))
      end
    end

    context "when log in failed" do
      before :each do
        controller.stub(:get_user_info).and_return(@failed_info)
        get :new_login, :ticket => @ticket
      end

      it "should set flash[:error]" do
        assigns(flash[:error]).should_not be_nil
      end

      it "should redirect to index page" do
        response.should redirect_to(root_path)
      end
    end
  end
end
