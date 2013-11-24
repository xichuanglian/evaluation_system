class TeacherController < ApplicationController
  layout "application" 
  def show_students
    @users = User.all
  end

  def comments
    @user = User.find params[:id]
    @form = @user.get_form
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

end