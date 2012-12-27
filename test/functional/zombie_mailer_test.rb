require 'test_helper'

class ZombieMailerTest < ActionMailer::TestCase
  test "email_change" do
    mail = ZombieMailer.email_change
    assert_equal "Email change", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
