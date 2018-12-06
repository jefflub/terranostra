module Api::V1
  class SlideshowsController < ApplicationController
    before_action :set_slideshow, only: [:show, :update, :destroy]

    # GET /slideshows
    def index
      @slideshows = Slideshow.all

      render json: @slideshows
    end

    # GET /slideshows/1
    def show
      render json: @slideshow
    end

    # POST /slideshows
    def create
      @slideshow = Slideshow.new(slideshow_params)

      if @slideshow.save
        render json: @slideshow, status: :created, location: @slideshow
      else
        render json: @slideshow.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /slideshows/1
    def update
      if @slideshow.update(slideshow_params)
        render json: @slideshow
      else
        render json: @slideshow.errors, status: :unprocessable_entity
      end
    end

    # DELETE /slideshows/1
    def destroy
      @slideshow.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_slideshow
        @slideshow = Slideshow.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def slideshow_params
        params.require(:slideshow).permit(:audio_url, :public)
      end
  end
end
