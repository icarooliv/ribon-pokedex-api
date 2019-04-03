class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, :with => :render_404

        def render_404
            render json: { error: "Not Found" }, status: :not_found
      end    
end
