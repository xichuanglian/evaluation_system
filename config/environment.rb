# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
EvaluationSystem::Application.initialize!
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => 25,
  :domain => "gmail.com",
  :authentication => :login,
  :user_name => "esff.manager@gmail.com",
  :password => "saasbook"
}