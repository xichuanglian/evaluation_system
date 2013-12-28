require 'spec_helper'

describe EducationInfosController do
  describe 'POST new' do
    before :each do
      @info_hash = {
        from: '2013-1-2',
        to: '2013-3-3',
        school: 'Abc School',
        remark: 'none'
      }
      @profile = FactoryGirl.create(:student_profile)
      session[:user] = @profile.student.id
    end

    it "should set correct foreign key profile_id" do
      post :new, id: @profile.id, education: @info_hash
      EducationInfo.last.student_profile_id.should == @profile.id
    end

    it "should contain correct info" do
      post :new, id: @profile.id, education: @info_hash
      new_info = EducationInfo.last
      new_info.school.should == @info_hash[:school]
      new_info.remark.should == @info_hash[:remark]
    end
  end

  describe 'DELETE delete' do
    before :each do
      @info = FactoryGirl.create(:education_info)
      @student = FactoryGirl.create(:student)
      session[:user] = @student.id
    end

    it "should delete specified academic activity info record" do
      delete :delete, id: @info.id
      EducationInfo.find_by(id: @info.id).should be_nil
    end
  end
end
