module Api::V1
  class SlidesController < ApplicationController
    before_action :set_slide, only: [:show, :update, :destroy]
    before_action :set_slideshow, only: [:create, :index]

    # GET /slideshows/1/slides
    def index
      @slides = @slideshow.slides

      render json: @slides
    end

    # GET /slides/1
    def show
      render json: @slide, include: :image
    end

    # POST /slideshows/1/slides
    def create
      @slide = @slideshow.slides.build(slide_params)

      if @slide.save
        # Returns the whole slideshow so that the new slide is seen in time context
        render json: @slideshow, status: :created, include: { slides: { include: :image } }
      else
        render json: @slide.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /slides/1
    def update
      if @slide.update(slide_params)
        render json: @slide
      else
        render json: @slide.errors, status: :unprocessable_entity
      end
    end

    # DELETE /slides/1
    def destroy
      @slide.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_slide
        @slide = Slide.find(params[:id])
      end

      def set_slideshow
        @slideshow = Slideshow.find(params[:slideshow_id])
      end

      # Only allow a trusted parameter "white list" through.
      def slide_params
        params.require(:slide).permit(:start_time, :title, :image_id, :notes, :slide_type)
      end
  end
end
