class ToursController < ApplicationController
  before_action :set_tour, only: %i[show update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

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
    if current_user.role == 'Admin'
      @tour = Tour.new(tour_params)
      @tour.user = current_user
      if @tour.save
        render json: { message: 'Tour was created succesfully.' }, status: :created, location: @tour
      else
        render json: @tour.errors, status: :unprocessable_entity
      end
    else
      render json: { message: "You don\'t have permission to create tours." }, status: :unauthorized
    end
  end

  # PATCH/PUT /tours/1
  def update
    if current_user.role == 'Admin'
      if @tour.update(tour_params)
        render json: { message: 'Tour was updated succesfully.' }
      else
        render json: @tour.errors, status: :unprocessable_entity
      end
    else
      render json: { message: "You don\'t have permission to update tours." }, status: :unauthorized
    end
  end

  # DELETE /tours/1
  def destroy
    if current_user.role == 'Admin'
      @tour.destroy
      render json: { message: 'Deleted successfully.' }, status: :ok
    else
      render json: { message: "You don\'t have permission to delete tours." }, status: :unauthorized
    end
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
