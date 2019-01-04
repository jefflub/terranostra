FactoryBot.define do
  factory :user do
    email { "foo@bar.com" }
    name { "MyText" }
    admin { false }
    password { "foobar" }
  end
end
