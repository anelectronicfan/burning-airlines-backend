class FlightsController < ApplicationController

    def search
        #Grab all the flights that match the search, order them by earliest date then map into a new array
        flights = Flight.order(:date).where(origin: params[:origin], destination: params[:destination]).map {|flight|
        
        updated_flight = flight.attributes #this makes a hash copy of the Flight so we can add to it
        
        #grab the reservations and plane for the flight
        reservations = Reservation.where(flight_id: flight.id)
        plane = Airplane.find_by(id: flight.airplane_id)
        #calculate the remaining seats
        total_seats = plane.total_rows * plane.total_columns
        remaining_seats = total_seats - reservations.length

        #add the remaining seats and the name of the plane to the hash
        updated_flight[:remaining_seats] = remaining_seats
        updated_flight[:plane_name] = plane.name
        
        #return the hash to add into the flights array
        updated_flight
        }


        render json: flights
    end

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
