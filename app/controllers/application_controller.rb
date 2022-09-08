class ApplicationController < ActionController::API

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response 
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response 
    
    private 

    def render_not_found_response(error)
        render json: { error: "#{error.model} not found" }, status: :not_found
    end
    
    def render_unprocessable_entity_response(error)
        render json: { errors: error.record.errors.full_messages }, status: :unprocessable_entity
    end

end
