class Emailer < ActionMailer::Base
    default :from => "esff.manager@gmail.com"  

    def remind(email)
        @message = "Thank you for confirmation!"
        mail(:to => email, :subject => "Reminder of filling evaluation forms")  
    end  
end
