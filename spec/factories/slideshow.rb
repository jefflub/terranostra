FactoryBot.define do
    factory :slideshow do
        audio_url { "http://www.foo.com/audio.mp3" }
        title { "Slideshow" }
        public { false }
        duration { 100 }
    end
end