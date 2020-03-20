module Api
  module V1
    class CartController < ApplicationController
      before_action :set_cart

      def show
        render json: @cart, status: :ok
      end

      def create
        @cart.add(cart_params)
        session[:cart] = @cart.products
      end

      def destroy
        @cart.remove(cart_params[:product_id].to_i)
      end

      private

      def cart_params
        params.permit(:product_id, :quantity)
      end

      def set_cart
        session[:cart] ||= {}
        @cart = Cart.new(session[:cart])
      end
    end
  end
end

