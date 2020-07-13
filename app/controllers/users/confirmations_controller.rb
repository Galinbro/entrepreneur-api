# frozen_string_literal: true

class Users::ConfirmationsController < Devise::ConfirmationsController
  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  # def create
  #   super
  # end

  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    self.resource = User.confirm_by_token(params[:confirmation_token])
    if resource.errors.empty?
      render json: {:status=> :ok, data: resource}
      #render file: 'v1/custom_devise/sessions/create', locals: { current_user: resource}
    else
      render json: {:status=> :unprocessable_entity, data: resource.errors.full_messages}
      #render file: "#{Rails.root}/public/422.json", status: :unprocessable_entity, locals: { errors: resource.errors.full_messages }
    end
  end

  # protected

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
  # def after_confirmation_path_for(resource_name, resource)
  #   super(resource_name, resource)
  # end
end
