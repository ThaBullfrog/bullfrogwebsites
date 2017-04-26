class QuoteRequest

  include ActiveModel::Model

  attr_accessor :email, :message

  validates :email, presence: true
  VALID_EMAIL_REGEX = /\A^(?!.*\.{2})[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }
  validates :message, presence: true

end