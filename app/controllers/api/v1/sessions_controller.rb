class Api::V1::SessionsController < Devise::SessionsController
  respond_to :json

  def new
    render json: {:status=> :ok, data: resource.as_json(only: [:id, :jti])}
  end
  
  private
  def respond_with(resource, _opts = {})
    if resource[:id]
      if resource[:confirmation_token]
        render json: {:status=> :ok, data: resource.as_json(only: [:id, :jti])}
      else
        render json: {:status=> :unauthorized, error: "Correo no ha sido confirmado"}
      end
    else
      # render json: resource.as_json(only: [:id, :jti]), status: :unauthorized
      render json: {:status=> :unauthorized, error: "Correo o contraseña no valida"}
    end
  end
  
  def respond_to_on_destroy
    head :no_content
  end

end
