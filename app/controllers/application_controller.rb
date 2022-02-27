class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_error_404
  rescue_from ActiveRecord::RecordInvalid, with: :render_error_400

  def render_error_404(error)
    render json: { error: { exception: error.to_s} }, status: 404
  end

  def render_error_400(error)
    render json: { error: { exception: error.to_s} }, status: 400
  end
end
