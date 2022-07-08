class ToursController < ApplicationController
  before_action :set_tour, only: %i[ show update destroy ]

  # GET /tours
  def index
    @tours = Tour.all

    render json: @tours
  end

  # GET /tours/1
  def show
    render json: @tour
  end

  # POST /tours
  def create
    @tour = Tour.new(tour_params)
    tour_dates.each { |tour_date| puts tour_date.date }
    if @tour.save
      render json: @tour, status: :created, location: @tour
    else
      render json: @tour.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tours/1
  def update
    if @tour.update(tour_params)
      render json: @tour
    else
      render json: @tour.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tours/1
  def destroy
    @tour.destroy
    render json: { message: 'Deleted successfully.' }, status: :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tour
    @tour = Tour.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tour_params
    # params.fetch(:tour, {})
    params.require(:tour).permit(:name, :location, :description, :price, :user_id, :tour_dates)
  end
end
