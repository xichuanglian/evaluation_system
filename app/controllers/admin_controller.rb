class AdminController < ApplicationController
  def new
  end

  def showall
    @users = User.all
    puts "=================="
    puts @users
    puts "=================="
  end
end