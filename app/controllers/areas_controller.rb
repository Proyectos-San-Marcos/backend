class AreasController < ApplicationController
  before_action :set_area, only: %i[show update destroy]

  # GET /areas
  def index
    @areas = Area.all

    render json: @areas, only: %i[id name management_id]
  end

  # GET /areas/1
  def show
    render json: @area
  end

  # POST /areas
  def create
    @area = Area.new(area_params)
    authorize @area

    if @area.save
      render json: @area, status: :created, location: @area
    else
      render json: @area.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /areas/1
  def update
    authorize @area
    if @area.update(area_params)
      render json: @area
    else
      render json: @area.errors, status: :unprocessable_entity
    end
  end

  # DELETE /areas/1
  def destroy
    authorize @area
    @area.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_area
    @area = Area.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def area_params
    params.require(:area).permit(:name, :management_id)
  end
end
