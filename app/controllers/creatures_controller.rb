class CreaturesController < ApplicationController
  before_action :set_creature, only: %i[ show update destroy]

  # GET /creatures
  def index
    @creatures = Creature.all.limit(10)

    response = {
      count: @creatures.count,
      creatures: @creatures.as_json
    }

    render json: response
  end

  # GET /creatures/:id
  def show
    render json: @creature
  end

  # POST /creatures
  def create
    @creature = Creature.new(creature_params)

    if @creature.save
      render json: @creature, status: :created, location: @creature
    else
      render json: @creature.errors, status: :unprocessable_content
    end
  end

  # DELETE /creatures/:id
  def destroy
    @creature.destroy!

    # head :no_content
  end

  # PATCH/PUT /creatures/:id
  def update
    if @creature.update(creature_params)
      render json: @creature
    else
      render json: @creature.errors, status: :unprocessable_content
    end
  end

  private

  def set_creature
    @creature = Creature.find(params.expect(:id))
  end

  def creature_params
    params.expect(creature: [ :name ])
  end
end
