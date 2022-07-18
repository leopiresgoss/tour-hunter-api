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
    reserves = fetch_my_reservations
    @my_reserves = []
    reserves.each do |reservation|
      @images = Tour.find_by_id(reservation['tour_id']).image_urls
      @my_reserves <<
      {
        reservation_id: reservation['reservation_id'],
        package: reservation['package'],
        tour_date_id: reservation['tour_date_id'],
        tour_date: reservation['tour_date'],
        tour_id: reservation['tour_id'],
        tour_name: reservation['tour_name'],
        tour_description: reservation['tour_description'],
        tour_images: @images,
        tour_price: reservation['tour_price'],
        tour_location: reservation['tour_location'],
        user_id: reservation['user_id'],
        full_name: reservation['full_name'],
        user_email: reservation['user_email']
      }
    end
    render json: @my_reserves, status: :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.permit(:package, :tour_date_id)
  end
end
