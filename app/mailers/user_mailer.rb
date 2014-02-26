class UserMailer < ActionMailer::Base
  default from: "denvergschool@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.match_confirmation.subject
  #
  def match_confirmation(requester_id, responder_id)
    @requester = User.find(requester_id)
    @responder = User.find(responder_id)

    mail to: @requester.email, cc: @responder.email, subject: "Intro: #{@requester.first_name} <> #{@responder.first_name}"
  end
end
