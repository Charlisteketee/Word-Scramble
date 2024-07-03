class GameController < ApplicationController
  before_action :authenticate_user!

  def new_game
    @word = Word.order("RANDOM()").first
    if @word
      @scrambled_word = @word.content.chars.shuffle.join
    else
      flash[:alert] = "No words available. Please add some to the database!"
      redirect_to new_word_path
    end
  end

  def guess
    @word = Word.find(params[:word_id])
    if params[:guess] == @word.content
      current_user.increment!(:score)
      flash[:notice] = "Correct!"
    else
      flash[:alert] = "Try again!"
    end
    redirect_to game_new_path
  end
end
