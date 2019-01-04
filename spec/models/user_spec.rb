require 'rails_helper'

RSpec.describe User, type: :model do
  it "accepts valid email addresses" do
    %w(jefflub@gmail.com jefflub+foo@gmail.com).each do |addr|
      user = build_stubbed( :user, email: addr )
      expect(user.valid?).to be true
    end
  end

  it "rejects invalid email addresses" do
    %w(jefflub jefflub@gmail @gmail.com).each do |addr|
      user = build_stubbed( :user, email: addr )
      expect(user.valid?).to be false
      expect(user.errors[:email]).to eq ["is invalid"]
    end
  end

  it "disallows duplicate email addresses" do
    user = create( :user )
    expect{create(:user, email: user.email)}.to raise_error(ActiveRecord::RecordNotUnique)
  end
end
