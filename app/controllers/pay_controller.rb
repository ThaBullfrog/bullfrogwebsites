class PayController < ApplicationController

  before_action :authenticate_user!, only: [:create, :destroy]

  def index
  end

  def create
    token = params[:stripeToken]
    customer = Stripe::Customer.create(card: token, 
                                       plan: Stripe::Plans::BASIC, 
                                       email: current_user.email)
    flash[:success] = "You've been subscribed to $6 monthly payments. "                            \
                    + "If this was a mistake email jeremiahkellick@icloud.com "                    \
                    + "or call (814) 573-7139"
    redirect_to pay_path
  end

  def destroy
  end

end
