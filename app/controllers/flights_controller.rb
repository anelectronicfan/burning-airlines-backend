class FlightsController < ApplicationController

    skip_before_action :verify_authenticity_token, raise: false

    def new
        @flight = Flight.new
    end

    def create
        @flight = Flight.new flight_params

    end

    def index
        flights = Flight.all.map {|flight|
        f = flight.attributes
        
        reservations = Reservation.where(flight_id: flight.id)
        plane = Airplane.find_by(id: flight.airplane_id)
        
        total_seats = plane.total_rows * plane.total_columns
        remaining_seats = total_seats - reservations.length
        f[:remaining_seats] = remaining_seats
        f[:plane_name] = plane.name
        f
        }

        render json: flights
    end

    def show
        @flight =  Flight.find params[:id]
        render json: @flight
    end

    def edit
    end

    def update
    end

    def destroy
        Flight.destroy params[:id]
        redirect_to flights_path
    end

    def flight_params
        params.require(:flight).permit(:name, :origin, :destination, :date, :airplane_id)
    end
end
