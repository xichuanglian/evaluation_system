class Emailer < ActionMailer::Base
    default :from => "esff.manager@gmail.com"  

    def remind(email)
        @message = "A kind reminder of filling evaluation form!"
        mail(:to => email, :subject => "Reminder of filling evaluation forms")  
    end  
end
