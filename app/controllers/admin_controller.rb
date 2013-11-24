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
        render admin_addnew_path
      elsif co_advisor_to_id(user_params) == nil
        @check_advisor[:co_advisor] = 'error'
        render admin_addnew_path
      elsif official_advisor_to_id(user_params) == nil
        @check_advisor[:official_advisor] = 'error'
        render admin_addnew_path
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
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    @user.update_attributes!(user_params)
    flash[:notice] = 'Successfully saved.'
    redirect_to admin_showall_path
  end

  def detail
    @user = User.find params[:id]
  end

  private

  def user_params
    params.require(:user).permit(:name, :job, :jobid, :email, :student_type,
      :enroll_year, :advisor, :co_advisor, :official_advisor)
  end

  def advisor_to_id(user_params)
    @user_advisor = User.find_by name: user_params[:advisor]
    if @user_advisor == nil
      return nil
    end
    new_user_params = user_params
    new_user_params[:advisor] = @user_advisor.jobid
    new_user_params.permit(:name, :job, :jobid, :email, :student_type,
      :enroll_year, :advisor, :co_advisor, :official_advisor)
  end

  def co_advisor_to_id(user_params)
    @user_co_advisor = User.find_by name: user_params[:co_advisor]
    if @user_co_advisor == nil
      return nil
    end
    new_user_params = user_params
    new_user_params[:co_advisor] = @user_co_advisor.jobid
    new_user_params.permit(:name, :job, :jobid, :email, :student_type,
      :enroll_year, :advisor, :co_advisor, :official_advisor)
  end

  def official_advisor_to_id(user_params)
    @user_official_advisor = User.find_by name: user_params[:official_advisor]
    if @user_official_advisor == nil
      return nil
    end
    new_user_params = user_params
    new_user_params[:official_advisor] = @user_official_advisor.jobid
    new_user_params.permit(:name, :job, :jobid, :email, :student_type,
      :enroll_year, :advisor, :co_advisor, :official_advisor)
  end
end