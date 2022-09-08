class ScientistsController < ApplicationController

    # before_action :set_scientist, only: [:show, :update, :destroy]

    def index 
        scientists = Scientist.all 
        render json: scientists, status: :ok
    end

    # def show 
    #     scientist = Scientist.find(params[:id])
    #     render json: scientist serializer: ScientistSerializer
    # end

    def show
        instance = Scientist.find(params[:id])
        render json: instance, serializer: ScientistPlanetsSerializer
    end

    #this is a method to use if you don't use the rescue_from macro
    # def show
    #     instance = Scientist.find_by(id: params[:id])
    #     if instance 
    #         render json: instance
    #     else 
    #         render json: { errors: "Couldn't find scientist with id=#{params[:id]}" }, status: 404
    #     end
    # end

     #this is another method to use if you don't use the rescue_from macro
    # def show
    #     begin
    #         instance = Scientist.find(params[:id])
    #         render json: instance
    #     rescue => err
    #         render json: {error: err.message}, status: 404
    #     end
    # end

    def create 
        scientist = Scientist.create!(scientist_params)
        render json: scientist, status: :created 
    end

    def update 
        scientist = Scientist.find(params[:id])
        scientist.update!(scientist_params)
        render json: scientist, status: :accepted 
    end

    def destroy 
        scientist = Scientist.find(params[:id])
        scientist.destroy 
        head :no_content
    end

    private 

    def scientist_params 
        params.permit(:name, :field_of_study, :avatar)
    end

end
