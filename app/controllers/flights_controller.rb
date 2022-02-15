class FlightsController < ApplicationController

    def new
        @flight = Flight.new
    end

    def create
        @flight = Flight.new flight_params
        @flight.save
        if @flight.persisted?
            redirect_to flights_path
        else
            render :new
        end
    end


    def index
        
        flights = Flight.where(origin: params[:origin], destination: params[:destination]).map {|flight|
        new_flight = flight.attributes
        
        reservations = Reservation.where(flight_id: flight.id)
        plane = Airplane.find_by(id: flight.airplane_id)
        
        total_seats = plane.total_rows * plane.total_columns
        remaining_seats = total_seats - reservations.length
        new_flight[:remaining_seats] = remaining_seats
        new_flight[:plane_name] = plane.name
        new_flight
        }

        render json: flights
    end

    def show
        @flight =  Flight.find params[:id]
        render json: @flight
    end

    def edit
        @flight =  Flight.find params[:id]       
    end

    def update
        @flight =  Flight.find params[:id] 
    end

    def destroy
        Flight.destroy params[:id]
        redirect_to flights_path
    end

    def flight_params
        params.require(:flight).permit(:name, :origin, :destination, :date, :airplane_id)
    end
end
