class QuoteRequestsController < ApplicationController

  def new
    @quote_request = QuoteRequest.new
  end

  def create
    @quote_request = QuoteRequest.new(quote_request_params)
    @quote_request.valid? # Makes it so if reCAPTCHA fails it still shows all errors
    if(verify_recaptcha(model: @quote_request) && @quote_request.valid?)
      mail_quote_request @quote_request
      flash[:success] = "Quote request sent."
      redirect_to contact_path
    else
      render 'new'
    end
  end

  private

    def quote_request_params
      return params.require(:quote_request).permit(:name, :email, :message)
    end

    def mail_quote_request(request)
      QuoteRequestMailer.quote_request(request).deliver_now
    end

end
