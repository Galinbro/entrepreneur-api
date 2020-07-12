class Api::V1::SessionsController < Devise::SessionsController
  respond_to :json

  private
  def respond_with(resource, _opts = {})
    if resource[:id]
      #render json: resource.as_json(only: [:id, :jti]), status: :ok
      render json: {:status=> :ok, data: resource.as_json(only: [:id, :jti])}
    else
      # render json: resource.as_json(only: [:id, :jti]), status: :unauthorized
      render json: {:status=> :unauthorized, error: "Correo o contraseña no valida"}
    end
  end
  
  def respond_to_on_destroy
    head :no_content
  end

end
