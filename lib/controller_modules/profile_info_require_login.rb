module ControllerModules
  module ProfileInfoRequireLogin
    def require_login
      @user = session[:user] && Student.find(session[:user])
      unless @user && @user.student_profile.id == params[:id].to_i
        redirect_to root_path
      end
      @profile = @user.student_profile
    end

    def require_login_for_delete
      @user = session[:user] && Student.find(session[:user])
      unless @user
        redirect_to root_path
      end
    end
  end
end
