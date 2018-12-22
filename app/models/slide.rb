class Slide < ApplicationRecord
    belongs_to :slideshow
    belongs_to :image

    SLIDE_TYPE_IMAGE = 0
    SLIDE_TYPE_FIXED_BEGIN = 1
    SLIDE_TYPE_FIXED_END = 2
end
