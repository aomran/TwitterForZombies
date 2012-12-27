class ZombieMailer < ActionMailer::Base
  default from: "aomra015@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.zombie_mailer.email_change.subject
  #
  def email_change(zombie)
    @zombie = zombie
    #@last_tweet = @zombie.tweets.last
    @greeting = "Hi"

    mail to: @zombie.email, subject: "Your email has changed"
  end
end
