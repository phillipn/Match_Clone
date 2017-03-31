class MatchMailer < ApplicationMailer
  default from: "from@example.com"

  def match_email(user)
    @user = user
    mail(to: 'phillipn101@gmail.com', subject: 'Match Email')
  end
end
