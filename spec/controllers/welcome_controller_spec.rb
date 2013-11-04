require "spec_helper"

describe WelcomeController do 
	describe "login" do
		it "should call User.verify to verify username and password" do
      post "login", {:username => "username", :password => "password"}
			User.should_receive(:verify)
		end

    describe "when username and password are correct" do
      before :each do
        @fake_user = double("User")
        User.stub(:verify).and_return(@fake_user)
      end

      it "should redirect to student form" do
        response.should redirect_to(student_form_path)
      end

      it "should save user in session" do
        assigns(session[:user]).should == @fake_user
      end
    end

    describe "when username and passowrd are not correct" do
      it "should set error message in flash and render index page" do
        assigns(flash[:error]).should == "Invalid username or passowrd!"
        response.should render_template("index")
      end
    end
	end
end