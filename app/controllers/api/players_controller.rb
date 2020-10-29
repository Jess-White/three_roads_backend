class Api::PlayersController < ApplicationController

    def index
      @players = Player.all
      @players = @players.order(id: :desc)
      render "index.json.jb"
    end

    def create
      @player = Player.new(
        username: params[:username],
        email: params[:email],
      )
      if @player.save
        render "show.json.jb"
      else
        render json: { errors: @player.errors.full_messages }, status: :bad_request
      end
    end

    def show
      @player = Player.find(params[:id])
      render "show.json.jb"
    end

    def update
      @player = Player.find(params[:id])
      @player.username = params[:username] || @player.username
      @player.email = params[:email] || @player.email
      if @player.save
        render "show.json.jb"
      else
        render json: { errors: @player.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def destroy
      player = Player.find(params[:id])
      player.destroy
      render json: { message: "player successfully deleted!" }
    end

end

