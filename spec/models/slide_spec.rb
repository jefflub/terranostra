require 'rails_helper'

RSpec.describe Slide do
    it "wont allow slides past end of audio" do
        @slideshow = create :slideshow
        @slide = @slideshow.slides.create(start_time: 500)
        expect(@slide.valid?).to be false
        expect(@slide.errors[:start_time]).not_to be_nil
    end
end