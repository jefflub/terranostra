FactoryBot.define do
    factory :slide do
        start_time { 0 }
        title { "Slide" }
        notes { "Notes" }
        slide_type { Slide::SLIDE_TYPE_IMAGE }
    end
end