module Api
  module V1
    class ProductsController < ApplicationController

      api :GET, '/products', 'An end-point used for displaying product list.'
      formats ['json']

      example '[
                {
                  "id":"1",
                  "name":"Product #1",
                  "description":"Product Description",
                  "price":"50"
                }, {
                  "id":"2",
                  "name":"Product #2",
                  "description":"Product Description",
                  "price":"150"
                }
              ]'

      def index
        render json: Product.all
      end
    end
  end
end

