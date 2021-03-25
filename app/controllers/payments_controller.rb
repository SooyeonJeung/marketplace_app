class PaymentsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:webhook]

    def success
    end

    def webhook
        payment_id = params[:data][:object][:payment_intent]
        payment = Stripe::PaymentIntent.retrieve(payment_id)
        product_id = payment.metadata.product_id
        user_id = payment.metadata.user_id
    
        product = Product.find(product_id.to_i)
        product.sold = true
        product.save
    
        render plain: "success"
    end
end