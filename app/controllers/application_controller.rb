class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, :with => :render_404
    rescue_from ActiveRecord::RecordNotUnique, :with => :render_409

        def render_404
            render json: { error: "Not Found" }, status: :not_found
        end    
        
        def render_409
            render json: { error: "Conflict" }, status: :conflict
        end    
end
