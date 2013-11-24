class AdminController < ApplicationController
  layout "application" 

  def new
    @check_advisor = Hash.new("")
  end

  def create
    @check_advisor = Hash.new("")
    if user_params[:job] == 'Student'
      if advisor_to_id(user_params) == nil
        @check_advisor[:advisor] = 'error'
        render 'new'
      elsif co_advisor_to_id(user_params) == nil
        @check_advisor[:co_advisor] = 'error'
        render 'new'
      elsif official_advisor_to_id(user_params) == nil
        @check_advisor[:official_advisor] = 'error'
        render 'new'
      else
        @user = User.create!(advisor_to_id(co_advisor_to_id(official_advisor_to_id(user_params))))
        flash[:notice] = 'Successfully added new user.'
        redirect_to admin_showall_path
      end
    else
      @user = User.create!(user_params)
      flash[:notice] = 'Successfully added new user.'
      redirect_to admin_showall_path
    end
  end

  def showall
    @users = User.all
  end

  def edit
    @check_advisor = Hash.new("")
    @user = User.find params[:id]
    @user_advisor_name = User.find_by(jobid: @user.advisor).name
    @user_co_advisor_name = User.find_by(jobid: @user.co_advisor).name
    @user_official_advisor_name = User.find_by(jobid: @user.official_advisor).name
  end

  def update
    @check_advisor = Hash.new("")
    @user = User.find params[:id]
    if user_params[:job] == 'Student'
      if advisor_to_id(user_params) == nil
        @check_advisor[:advisor] = 'error'
        render 'edit'
      elsif co_advisor_to_id(user_params) == nil
        @check_advisor[:co_advisor] = 'error'
        render 'edit'
      elsif official_advisor_to_id(user_params) == nil
        @check_advisor[:official_advisor] = 'error'
        render 'edit'
      else
        @user = User.update(@user.id, advisor_to_id(co_advisor_to_id(official_advisor_to_id(user_params))))
        flash[:notice] = 'Successfully saved.'
        redirect_to admin_showall_path
      end
    else
      @user = User.update(@user.id, user_params)
      flash[:notice] = 'Successfully saved.'
      redirect_to admin_showall_path
    end
  end

  def detail
    @user = User.find params[:id]
    @user_advisor_name = User.find_by(jobid: @user.advisor).name
    @user_co_advisor_name = User.find_by(jobid: @user.co_advisor).name
    @user_official_advisor_name = User.find_by(jobid: @user.official_advisor).name
  end

  private

  def user_params
    params.require(:user).permit(:name, :job, :jobid, :email, :student_type,
      :enroll_year, :advisor, :co_advisor, :official_advisor)
  end

  def advisor_to_id(user_params)
    @user_advisor = User.find_by name: user_params[:advisor], job: 'Teacher'
    if @user_advisor == nil
      return nil
    end
    new_user_params = user_params
    new_user_params[:advisor] = @user_advisor.jobid
    new_user_params.permit(:name, :job, :jobid, :email, :student_type,
      :enroll_year, :advisor, :co_advisor, :official_advisor)
  end

  def co_advisor_to_id(user_params)
    @user_co_advisor = User.find_by name: user_params[:co_advisor], job: 'Teacher'
    if @user_co_advisor == nil
      return nil
    end
    new_user_params = user_params
    new_user_params[:co_advisor] = @user_co_advisor.jobid
    new_user_params.permit(:name, :job, :jobid, :email, :student_type,
      :enroll_year, :advisor, :co_advisor, :official_advisor)
  end

  def official_advisor_to_id(user_params)
    @user_official_advisor = User.find_by name: user_params[:official_advisor], job: 'Teacher'
    if @user_official_advisor == nil
      return nil
    end
    new_user_params = user_params
    new_user_params[:official_advisor] = @user_official_advisor.jobid
    new_user_params.permit(:name, :job, :jobid, :email, :student_type,
      :enroll_year, :advisor, :co_advisor, :official_advisor)
  end
end