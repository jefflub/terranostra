class Slide < ApplicationRecord
    belongs_to :slideshow
    belongs_to :image

    validate :validate_within_audio_duration

    default_scope { order(start_time: :asc) }

    def validate_within_audio_duration
        unless self.start_time < slideshow.duration
            errors.add :start_time, "must be before the end of the slideshow audio."
        end
    end

    SLIDE_TYPE_IMAGE = 0
    SLIDE_TYPE_FIXED_BEGIN = 1
    SLIDE_TYPE_FIXED_END = 2
end
