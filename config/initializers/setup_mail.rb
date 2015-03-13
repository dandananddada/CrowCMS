ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
	:address => "smtp.gmail.com",
	:port => 587,
	:domain => "gmail.com",
	:user_name => APP_CONFIG['gmail_username'], #ENV['GMAIL_USERNAME'],
	:password => APP_CONFIG['gmail_password'], #ENV['GMAIL_PASSWORD'],
	:authentication => "plain",
	:enable_starttls_auto => true
}