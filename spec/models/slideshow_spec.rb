require 'rails_helper'

RSpec.describe Slideshow do
    it "keeps slides in time order" do
        @slideshow = create :slideshow
        @image = create :image
        @slideshow.slides.create image_id: @image.id, title: "Slide 2", start_time: 50
        @slideshow.slides.create image_id: @image.id, title: "Slide 1", start_time: 0
        @slideshow.slides.create image_id: @image.id, title: "Slide 3", start_time: 75
        expect(@slideshow.slides.first.title).to eq "Slide 1"
        expect(@slideshow.slides[2].title).to eq "Slide 3"
    end

end