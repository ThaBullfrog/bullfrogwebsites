# Preview all emails at http://localhost:3000/rails/mailers/quote_request_mailer
class QuoteRequestMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/quote_request_mailer/quote_request
  def quote_request
    QuoteRequestMailer.quote_request(QuoteRequest.new(name: "Test Name", email: "test@example.com", description: "hello"))
  end

end
