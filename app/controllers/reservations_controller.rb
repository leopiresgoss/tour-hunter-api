class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show update destroy]

  # GET /reservations
  def index
    @reservations = Reservation.where(user_id: current_user.id)

    render json: @reservations
  end

  # GET /reservations/1
  def show
    render json: @reservation
  end

  # POST /reservations
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    if @reservation.save
      render json: { message: 'Booked successfully.' }, status: :created, location: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reservations/1
  def destroy
    @reservation.destroy
    render json: { message: 'Cancelled successfully.' }, status: :ok
  end

  # my_reservations
  def my_reservations
    sql = "SELECT r.id as reservation_id, r.package, r.tour_date_id,
    td.date as tour_date, t.id as tour_id, t.name as tour_name,
    t.description as tour_description,
    t.price as tour_price, t.location as tour_location,
    u.id as user_id, u.full_name, u.email as user_email
    FROM reservations  as r INNER JOIN
    tour_dates as td ON r.tour_date_id=td.id INNER JOIN
    tours as t ON td.tour_id=t.id  INNER JOIN
    users as u ON r.user_id=u.id
    WHERE r.user_id = #{current_user.id}"
    reserves = ActiveRecord::Base.connection.execute(sql)

    @my_reserves = attach_images(reserves)
    render json: @my_reserves, status: :ok
  end

  private

  def attach_images(reserves)
    @my_reserves = []
    reserves.each do |reservation|
      @images = Tour.find_by_id(reservation['tour_id']).image_urls
      reservation['tour_images'] = @images
      @my_reserves << reservation
    end
    @my_reserves
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.permit(:package, :tour_date_id)
  end
end
