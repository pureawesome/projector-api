class TestEmailJob < ActiveJob::Base
  queue_as :email

  def perform(email)
    UserMailer.test_email(email).delivery_now
  end

  #NOTE You could have an urgent queue and something else like daily, hourly
end
