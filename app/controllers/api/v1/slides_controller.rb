module Api::V1
  class SlidesController < ApplicationController
    before_action :set_slide, only: [:show, :update, :destroy]

    # GET /slides
    def index
      @slides = Slide.all

      render json: @slides
    end

    # GET /slides/1
    def show
      render json: @slide, include: :image
    end

    # POST /slides
    def create
      @slide = Slide.new(slide_params)

      if @slide.save
        render json: @slide, status: :created, location: @slide
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

      # Only allow a trusted parameter "white list" through.
      def slide_params
        params.require(:slide).permit(:start_time, :duration, :notes)
      end
  end
end
