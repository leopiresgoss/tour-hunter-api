class ToursController < ApplicationController
  before_action :set_tour, only: %i[show update destroy]

  # GET /tours
  def index
    @tours = Tour.includes(:user, :tour_dates, :images_attachments).all

    render json: @tours
  end

  # GET /tours/1
  def show
    render json: @tour
  end

  # POST /tours
  def create
    @tour = Tour.new(tour_params)
    @tour.user = current_user
    if @tour.save
      render json: @tour, status: :created, location: @tour
    else
      puts 'Testing'
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
    params.permit(:name,
                  :location,
                  :description,
                  :price,
                  images: [],
                  tour_dates_attributes: [:date])
  end
end
