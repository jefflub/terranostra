class Image < ApplicationRecord
    has_many :slides
    has_many :slideshows, through: :slides
end
