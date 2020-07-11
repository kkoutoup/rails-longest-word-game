require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = ("a".."z").to_a.sample(10)
  end

  def score
    @answer = params[:answer]
    @letters = params[:letters]
    @english_word = english_word?(@answer)
  end

  private

  def check_answer
    @answer.split("") - @letters.split("")
  end

  def english_word?(input)
    url = "https://wagon-dictionary.herokuapp.com/#{input}"
    json_string = open(url).read
    response = JSON.parse(json_string)
    response["found"]
  end
end
