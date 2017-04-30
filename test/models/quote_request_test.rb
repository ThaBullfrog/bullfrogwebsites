require 'test_helper'

class QuoteRequestTest < ActiveSupport::TestCase

  def setup
    @request = QuoteRequest.new(name: 'valid name', email: 'validemail@example.com', message: 'valid')
  end

  test "should be valid" do
    assert @request.valid?
  end

  test "email should not be blank" do
    @request.email = '   '
    assert_not @request.valid?
  end

  test "email should not be too long" do
    @request.email = 'a' * 50 + '@example.com'
    assert_not @request.valid?
  end

  test "email should be a valid format" do
    @request.email = 'invalid-at-email-dot-com'
    assert_not @request.valid?
  end

  test "name should not be blank" do
    @request.name = '    '
    assert_not @request.valid?
  end

  test "name should not be too long" do
    @request.name = 'a' * 51
    assert_not @request.valid?
  end

  test "name should not be too short" do
    @request.name = 'aa'
    assert_not @request.valid?
  end

  test "message should not be blank" do
    @request.message = '     '
    assert_not @request.valid?
  end

end
