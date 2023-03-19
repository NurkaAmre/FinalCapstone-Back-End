class Api::V1::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(user_id: params[:user_id])

    if @reservations.empty?
      render json: 'Nothing Found!', status: :not_found
    else
      render json: @reservations, status: :ok
    end
  end

  def create
    @new_reservation = Reservation.new(
      user_id: params[:user_id],
      book_id: params[:book_id],
      city: params[:city],
      date_of_booking: params[:date_of_booking],
      date_of_delivery: params[:date_of_delivery]
    )

    if @new_reservation.save
      render json: 'Resevation Created!', status: :ok
    else
      render json: @new_reservation.errors, status: :unprocessable_entity
    end
  end

  def reservation_params
    params.require(:reservation).permit(:user_id, :book_id, :city, :date_of_booking, :date_of_delivery)
  end
end
