require 'pry'

module Api::V1
  class CharactersController < ApplicationController
    def index
      @characters = Character.all
      render json: @characters
    end

    def show
      @character = Character.find(params['id'])
      render json: @character
    end

    def create
      @character = Character.create(character_params)
      render json: @character, status: 201
    end

    private

    def character_params
      params.require(:character).permit(:name, :description, :thumbnail, :comic_count)
    end
  end
end
