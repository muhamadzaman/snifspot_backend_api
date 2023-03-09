class ReviewsController < ApplicationController
    
    skip_before_action :verify_authenticity_token
    before_action :find_spot, only: [:create]
    before_action :find_spot_review, only: [:update]

    def create
        if @spot.reviews.create(review_params)
            render json: { message: "Review Added Successfully" }, status: :ok
        else
            render json: { message: "Unable to add a review" }, status: :unprocessable_entity
        end
    end

    def update
        if @review.update(review_params)
            render json: { message: "Review Upated Successfully" }, status: :ok
        else
            render json: { message: "Unable to edit the review" }, status: :unprocessable_entity
        end
    end
    
    private

    def find_spot
        @spot = Spot.find_by_id(params[:spot_id])

        render json: { message: "No such spot matches to that id." }, status: :unprocessable_entity unless @spot
    end

    def find_spot_review
        @review = Review.find_by_id(params[:id])

        render json: { message: "No such review matches to that id." }, status: :unprocessable_entity unless @review
    end

    def review_params
        params.permit(:rating, :review_comment)
    end
end
