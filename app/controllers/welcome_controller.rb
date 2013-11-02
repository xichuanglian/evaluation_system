class WelcomeController < ApplicationController
  def index
  end

  def login
    redirect_to student_form_path
  end
end
