class Slideshow < ApplicationRecord
    has_many :slides
    has_many :images, through: :slides
end
