class Users::RegistrationsController < Devise::RegistrationsController
  include ActionController::Helpers
  include ActionController::Flash
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    render json: { user: current_user }, status: :ok
  end

  def register_failed
    render json: { message: "Something went wrong." }
  end
end