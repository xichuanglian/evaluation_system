class AdminController < ApplicationController
  def new
    
  end

  def create
    @user = User.create!(user_params)
    flash[:notice] = 'Successfully added new user.'
    redirect_to admin_showall_path
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

  private

  def user_params
    params.require(:user).permit(:name, :job, :jobid, :email, :student_type, 
      :enroll_year, :advisor, :co_advisor, :official_advisor)
  end
end