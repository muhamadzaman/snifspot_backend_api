class SpotsController < ApplicationController
    
    skip_before_action :verify_authenticity_token
    before_action :list_spots, only: [:index]
    before_action :find_spot, only: [:show, :update]
    
    def index
        render json: @spot_list, status: :ok
    end

    def show
        data = SpotSerializer.new(@spot).serializable_hash.dig(:data, :attributes)
        
        render json: data, status: :ok
    end

    def create
        spot = Spot.new(spot_params)
        spot.images = upload_images(spot_params[:images]) unless spot_params[:images].blank?

        if spot.save
            render json: { message: "Spot Added Successfully" }, status: :ok
        else
            render json: { message: "Unable to add a Spot" }, status: :unprocessable_entity
        end
    end

    def update
        images = upload_images(params[:images]) unless params[:images].blank?
        if @spot.update(spot_params.merge({images: images}))
            render json: { message: "Spot updated Successfully" }, status: :ok
        else
            render json: { message: "Unable to edit a Spot" }, status: :unprocessable_entity
        end
    end

    private

    def list_spots
        @spot_list = SpotSerializer.new(Spot.all).serializable_hash[:data]

        render json: { message: "No spot available/created yet." }, status: :unprocessable_entity unless @spot_list
        
        @spot_list = @spot_list.map { |h| h[:attributes] }
    end

    def find_spot
        @spot = Spot.find_by_id(params[:id])
        
        render json: { message: "No such spot matches to that id." }, status: :unprocessable_entity unless @spot
    end

    def spot_params
        params.permit(:title, :description, :price, images: [])
    end

    def upload_images(images)
        images.each_with_object([]) do |image, list|
            list.append(image) if image.class.eql? String
            next if image.class.eql? String
            request = Cloudinary::Uploader.upload(image)
            list.append(request['secure_url'])
        end
    end
end
