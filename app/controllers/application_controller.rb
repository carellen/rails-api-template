class ApplicationController < ActionController::API

  def route_not_found
    render status: :not_found, json: {
      error: {
        type: 'invalid_request_error',
        message: "Unable to resolve the request #{request.method} #{request.path}."
      }
    }
  end

  rescue_from Apipie::ParamInvalid do |exception|
    render status: 400, json: { error: exception.error }
  end
end
