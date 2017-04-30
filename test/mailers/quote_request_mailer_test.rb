require 'test_helper'

class QuoteRequestMailerTest < ActionMailer::TestCase

  test "quote_request" do
    request = QuoteRequest.new(name: "Test Name", email: "test@example.com", description: "test message")
    mail = QuoteRequestMailer.quote_request(request)
    assert_equal "QUOTE REQUEST", mail.subject
    assert_equal ["jeremiahkellick@icloud.com"], mail.to
    assert_equal [request.email], mail.from
    assert_match request.description, mail.body.encoded
    assert_match request.name, mail.body.encoded
    assert_match request.email, mail.body.encoded
  end

end
