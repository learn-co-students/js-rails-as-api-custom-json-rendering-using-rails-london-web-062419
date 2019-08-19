class BirdsController < ApplicationController
  def index
    birds = Bird.all
    # render json: birds, except: [:created_at, :updated_at]
    # render json: birds, only: [:id, :name, :species] <--exactly same as above
    render json: birds.to_json(except: [:created_at, :updated_at])
    #to_json
  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      #if the bird exists then render these details of it
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      #show the error message
      render json: { message: 'Bird not found' }
    end
  end
end