require 'rails_helper'

RSpec.describe Slide do
    it "wont allow new slides past end of audio" do
        slideshow = create :slideshow
        image = create :image
        slide = slideshow.slides.create(image_id: image.id, start_time: 500)
        expect(slide.valid?).to be false
        expect(slide.errors[:start_time]).not_to be_nil
    end

    it "wont allow slides to edit past end of audio" do
        slideshow = create :slideshow
        image = create :image
        slide = slideshow.slides.create(image_id: image.id, start_time: 25)
        expect(slide.valid?).to be true
        slideshow.save
        slide.update(start_time: 500)
        expect(slide.errors[:start_time]).not_to be_nil
    end
end