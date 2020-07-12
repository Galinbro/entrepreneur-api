class Api::V1::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    build_resource(sign_up_params)
    if resource.save
      #render json: resource, status: :created
      render json: {:status=> :ok, data: resource.as_json(only: [:id, :jti])}
    else
      #render json: resource.errors.full_messages, status: :unauthorized
      render json: {:status=> :unauthorized, error: resource.errors.full_messages}
    end
  end

end
