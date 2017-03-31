class MatchMailerPreview < ActionMailer::Preview
  def match_mail_preview
    MatchMailer.sample_email(User.first)
  end
end
