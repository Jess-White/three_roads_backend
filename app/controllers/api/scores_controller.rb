class Api::ScoresController < ApplicationController

    def index
      @scores = Score.all
      @scores = @scores.order(id: :desc)
      render "index.json.jb"
    end

    def create
      @score = Score.new(
        username: params[:username],
        correct: params[:correct],
        incorrect: params[:incorrect]
      )
      if @score.save
        render "show.json.jb"
      else
        render json: { errors: @score.errors.full_messages }, status: :bad_request
      end
    end

    def show
      @score = Score.find(params[:id])
      render "show.json.jb"
    end

    def update
      @score = Score.find(params[:id])
      @score.username = params[:username] || @score.username
      @score.correct = params[:correct] || @score.correct
      @score.incorrect = params[:incorrect] || @score.incorrect
      if @score.save
        render "show.json.jb"
      else
        render json: { errors: @score.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def destroy
      score = Score.find(params[:id])
      score.destroy
      render json: { message: "score successfully deleted!" }
    end
end

