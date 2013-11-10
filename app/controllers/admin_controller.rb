class AdminController < ApplicationController
  def new
  end

  def showall
    @users = User.all
  end

end