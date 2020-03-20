module Api
  class CartValidator < Apipie::Validator::BaseValidator

    def initialize(param_description, argument)
      super(param_description)
      @method = param_description.method_description.method
      @errors = {
        params: [],
        type: 'invalid_param_error',
        message: 'Invalid data parameters'
      }
    end

    def validate(value)
      @errors[:params] = []
      case @method
      when 'create'
        then
        validate_product_id(value[:product_id])
        validate_quantity(value[:quantity])
      when 'destroy'
        then validate_product_id(value.to_i)
      end
      @errors[:params].empty?
    end

    def self.build(param_description, argument, options, block)
      new(param_description, argument)
    end

    def description
      @errors
    end

    private

    def validate_product_id(id)
      message = if id.blank?
                  'Product cannot be blank.'
                elsif !id.is_a?(Integer)
                  'Product ID must be an integer.'
                elsif !Product.exists?(id)
                  'There is no such Product in system.'
                end
      return unless message

      @errors[:params].push(code: 'invalid', message: message, name: 'product_id')
    end

    def validate_quantity(quantity)
      message = if quantity.blank?
                  'Quantity cannot be blank.'
                elsif !quantity.is_a?(Integer)
                  'Quantity must be integer.'
                elsif !(1..10).cover?(quantity)
                  'Quantity must be from 1 to 10.'
                end
      return unless message

      @errors[:params].push(code: 'invalid', message: message, name: 'quantity')
    end
  end
end
