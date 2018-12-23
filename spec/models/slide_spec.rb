require 'rails_helper'

RSpec.describe Slide do
    it "works" do
        @slide = build :slide
        expect(@slide.title).to eq "Slide"
    end
end