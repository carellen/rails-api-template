module Api
  module V1
    class CartController < ApplicationController
      before_action :set_cart

      api :GET, '/cart', 'An end-point used for displaying cart.'
      formats ['json']

      def show
        render json: @cart, status: :ok
      end

      api :POST, '/cart', 'An end-point used for adding product to the cart.'
      formats ['json']
      param :cart, CartValidator, desc: 'Product details'

      def create
        @cart.add(cart_params)
        session[:cart] = @cart.products
      end

      api :DELETE, '/cart/:product_id', 'An end-point used for removing product from the cart.'
      formats ['json']
      param :product_id, CartValidator, desc: 'Product ID'

      def destroy
        @cart.remove(cart_params[:product_id].to_i)
      end

      private

      def cart_params
        params.permit(:cart, :product_id, :quantity)
      end

      def set_cart
        session[:cart] ||= {}
        @cart = Cart.new(session[:cart])
      end
    end
  end
end

