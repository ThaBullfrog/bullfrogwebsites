require 'test_helper'

class QuoteRequestsTest < ActionDispatch::IntegrationTest

  def setup
    ActionMailer::Base.deliveries.clear
  end

  test "users should be able to submit quote requests" do
    get contact_path
    assert_template 'quote_requests/new'
    post contact_path, params: { quote_request: { name: 'valid name', 
                                                  email: 'validemail@example.com', 
                                                  description: 'valid message' } }
    assert_equal 1, ActionMailer::Base.deliveries.size
    assert_not flash.empty?
  end

  test "invalid quote requests should be rejected and errors displayed" do
    get contact_path
    assert_template 'quote_requests/new'
    post contact_path, params: { quote_request: { name: 'name', 
                                                  email: 'invalidemail', 
                                                  description: 'hello' } }
    assert_select 'div.alert-danger'
  end

end
