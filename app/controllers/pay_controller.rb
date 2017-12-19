class PayController < ApplicationController

  def index
  end

  def create
    token = params[:stripeToken]
    email = params[:stripeEmail]
    customer = Stripe::Customer.create(card: token, 
                                       plan: Stripe::Plans::BASIC, 
                                       email: email)
    flash[:success] = "You've been subscribed to $6 monthly payments. "                            \
                      "If this was a mistake email jeremiahkellick@gmail.com "                     \
                      "or call (814) 573-7139"
    redirect_to pay_path
  end

  def destroy
  end

end
