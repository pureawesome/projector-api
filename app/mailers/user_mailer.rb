class UserMailer < ActionMailer::Base
  default from: 'noreply@example.com'

  def test_email(email)
    mail(
      to: email,
      subject: 'Testing Active Mailer'
    )
  end
end
