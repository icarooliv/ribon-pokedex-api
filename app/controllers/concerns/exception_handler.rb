module ExceptionHandler
    extend ActiveSupport::Concern
  
    included do
      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: { :errors => {error: e.message} }, status: :not_found
      end
  
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: { :errors => {error: e.message} }, status: :unprocessable_entity
      end
    
      rescue_from ActiveRecord::RecordNotUnique do |e|
        render json: { :errors => {error: 'Duplicated unique value'} }, status: :unprocessable_entity
      end
        
        rescue_from ActionController::ParameterMissing do |e|
          render json: { :errors => {error: e.message} }, status: :unprocessable_entity
        end
    end 
  end
