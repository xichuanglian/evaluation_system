require 'spec_helper'

describe ClassesTakenInfosController do
  describe 'POST new' do
    before :each do
      @info_hash = {
        course_number: 'def234',
        name: 'The Course',
        instructor: 'Bar Foo',
        time: 'now',
        credits: '1',
        score: 60,
        remark: 'none'
      }
      @profile = FactoryGirl.create(:student_profile)
      session[:user] = @profile.student.id
    end

    it "should set correct foreign key profile_id" do
      post :new, id: @profile.id, classes_taken: @info_hash
      ClassesTakenInfo.last.student_profile_id.should == @profile.id
    end

    it "should contain correct info" do
      post :new, id: @profile.id, classes_taken: @info_hash
      new_info = ClassesTakenInfo.last
      new_info.course_number.should == @info_hash[:course_number]
      new_info.instructor.should == @info_hash[:instructor]
      new_info.score.should == @info_hash[:score]
    end
  end

  describe 'DELETE delete' do
    before :each do
      @info = FactoryGirl.create(:classes_taken_info)
      @student = FactoryGirl.create(:student)
      session[:user] = @student.id
    end

    it "should delete specified academic activity info record" do
      delete :delete, id: @info.id
      ClassesTakenInfo.find_by(id: @info.id).should be_nil
    end
  end
end
