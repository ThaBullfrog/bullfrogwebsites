class QuoteRequestsController < ApplicationController

  def new
    @quote_request = QuoteRequest.new
  end

  def create
    @quote_request = QuoteRequest.new(quote_request_params)
    unless(@quote_request.valid?)
      render 'new'
    end
  end

  private

    def quote_request_params
      return params.require(:quote_request).permit(:from, :message)
    end

end
