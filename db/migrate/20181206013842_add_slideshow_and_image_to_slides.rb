class AddSlideshowAndImageToSlides < ActiveRecord::Migration[5.2]
  def change
    add_reference :slides, :slideshow, foreign_key: true
    add_reference :slides, :image, foreign_key: true
  end
end
