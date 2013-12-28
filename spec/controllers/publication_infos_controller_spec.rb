require 'spec_helper'

describe PublicationInfosController do
  describe 'POST new' do
    before :each do
      @info_hash = {
        title: 'Publication Info',
        co_authors: 'co authors',
        pub_type: 'pub',
        name: 'pub name',
        year: 2014,
        form: 'poster',
        remark: 'none'
      }
      @profile = FactoryGirl.create(:student_profile)
      session[:user] = @profile.student.id
    end

    it "should set correct foreign key profile_id" do
      post :new, id: @profile.id, publication: @info_hash
      PublicationInfo.last.student_profile_id.should == @profile.id
    end

    it "should contain correct info" do
      post :new, id: @profile.id, publication: @info_hash
      new_info = PublicationInfo.last
      new_info.title.should == @info_hash[:title]
      new_info.co_authors.should == @info_hash[:co_authors]
      new_info.pub_type.should == @info_hash[:pub_type]
      new_info.name.should == @info_hash[:name]
      new_info.year.should == @info_hash[:year]
      new_info.form.should == @info_hash[:form]
      new_info.remark.should == @info_hash[:remark]
    end
  end

  describe 'DELETE delete' do
    before :each do
      @info = FactoryGirl.create(:publication_info)
      @student = FactoryGirl.create(:student)
      session[:user] = @student.id
    end

    it "should delete specified academic activity info record" do
      delete :delete, id: @info.id
      PublicationInfo.find_by(id: @info.id).should be_nil
    end
  end
end
