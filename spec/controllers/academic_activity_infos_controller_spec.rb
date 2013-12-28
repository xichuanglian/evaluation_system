require 'spec_helper'

describe AcademicActivityInfosController do
  describe 'POST new' do
    before :each do
      @info_hash = {
        date: '2010-1-1',
        activity_type: 'Presentations',
        details: 'none',
        remark: 'none'
      }
      @profile = FactoryGirl.create(:student_profile)
      @other_student = FactoryGirl.create(:student)
    end

    context 'when user has logged in' do
      before :each do
        session[:user] = @profile.student.id
      end

      it "should set correct foreign key profile_id" do
        post :new, id: @profile.id, academic_activity: @info_hash
        AcademicActivityInfo.last.student_profile_id.should == @profile.id
      end

      it "should contain correct info" do
        post :new, id: @profile.id, academic_activity: @info_hash
        new_info = AcademicActivityInfo.last
        new_info.activity_type.should == @info_hash[:activity_type]
        new_info.details.should == @info_hash[:details]
        new_info.remark.should == @info_hash[:remark]
      end
    end

    context "when user try to modify other student's profile" do
      before :each do
        session[:user] = @other_student.id
      end

      it "should redirect to root path" do
        post :new, id: @profile.id, academic_activity: @info_hash
        response.should redirect_to(root_path)
      end
    end

    context 'when user has not logged in' do
      it "should redirect to root_path" do
        post :new, id: @profile.id, academic_activity: @info_hash
        response.should redirect_to(root_path)
      end
    end
  end

  describe 'DELETE delete' do
    before :each do
      @info = FactoryGirl.create(:academic_activity_info)
      @student = FactoryGirl.create(:student)
    end

    context 'when user has logged in' do
      before :each do
        session[:user] = @student.id
      end

      it "should delete specified academic activity info record" do
        delete :delete, id: @info.id
        AcademicActivityInfo.find_by(id: @info.id).should be_nil
      end
    end

    context 'when user has not logged in' do
      it "should redirect to root path" do
        delete :delete, id: @info.id
        response.should redirect_to(root_path)
      end
    end
  end
end
