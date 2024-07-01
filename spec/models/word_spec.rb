require 'rails_helper'

RSpec.describe Word, type: :model do
  it "is valid with valid attributes" do
    word = Word.new(content: "example")
    expect(word).to be_valid
  end

  it "is not valid without content" do
    word = Word.new
    expect(word).not_to be_valid
  end
end
