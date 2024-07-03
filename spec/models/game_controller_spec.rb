require 'rails_helper'


RSpec.describe GameController, type: :controller do
  before do
    @user = User.create(username: "testeruser", password: "password")
    @word = Word.create(content: "example")
    sign_in @user
  end

  describe "GET #new_game" do
    it "returns http success" do
      get :new_game
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #guess" do
    it "incremenets the user's score on a correct guess" do
      post :guess, params: { word_id: @word.id, guess: "example" }
      expect(@user.reload.score).to eq(1)
    end

    it "does not increment the user's score on an incorrect guess" do
      post :guess, params: { word_id: @word.id, guess: "wrong" }
      expect(@user.reload.score).to eq(0)
    end
  end
end
