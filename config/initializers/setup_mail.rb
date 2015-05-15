ActionMailer::Base.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => 587,
    :domain => "gmail.com",
    :user_name => "11111111111@gmail.com",
    :password => "111123",
    :authentication => "plain",
    :enable_starttls_auto => true
}
