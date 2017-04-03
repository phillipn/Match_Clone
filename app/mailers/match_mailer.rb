class MatchMailer < ApplicationMailer
  default from: "from@example.com"

  def match_email(user, sender)
    @user = user
    @sender = sender
    mail(to: 'phillipn101@gmail.com', subject: 'Meet up request')
  end
end
