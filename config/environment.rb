# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Vcard::Application.initialize!

ActionMailer::Base.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => "587",
    :domain => "http://localhost:3000",
    :authentication => :plain,
    :user_name => "kostev.no.reply@gmail.com",
    :password => "qwe123QWE",
    :enable_starttls_auto => true
}

