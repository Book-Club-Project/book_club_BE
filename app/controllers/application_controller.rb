class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_error_404

  def render_error_404(error)
    render json: { error: { exception: error.to_s} }, status: 404
  end
end
