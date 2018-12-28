require "rails_helper"

RSpec.describe "Slide management", :type => :request do

  it "creates a slide" do
    slideshow = create :slideshow
    image = create :image
    headers = { "CONTENT_TYPE" => "application/json" }
    post "/api/v1/slideshows/#{slideshow.id}/slides", :params => %|{ "slide": { "image_id": #{image.id}, "title": "Slide 1", "start_time": 50 } }|, :headers => headers
    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(:created)
  end

end