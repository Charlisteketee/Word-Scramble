require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = User.new(username: "testuser", password: "password")
    expect(user).to be_valid
  end

  it "is not valid without a username" do
    user = User.new(password: "password")
    expect(user).not_to be_valid
  end

  it "is not valid without a password" do
    user = User.new(username: "testuser")
    expect(user).not_to be_valid
  end
end
