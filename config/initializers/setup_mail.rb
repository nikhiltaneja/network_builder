ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "network-builder.com",
  :user_name            => "denvergschool",
  :password             => "g$chooldenver",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
