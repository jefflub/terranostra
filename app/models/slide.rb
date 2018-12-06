class Slide < ApplicationRecord
    belongs_to :slideshow
    belongs_to :image
end
