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
        @flight = Flight.new
        @flights =  Flight.all.reverse
    end

    def show
        # Grab the flight that matches params[:id]
        flight =  Flight.find params[:id]

        # Grab the associated airplane
        airplane = Airplane.find_by(id: flight.airplane_id)  

        # Grab the current user(for now, it's hard coded to be User.first)
        user = User.first

        # Grab all associated reservations
        reservations_array = Reservation.where(flight_id: flight.id)  # This is an array of reservation objects
                                                                # Can't add new rows to the object that aren't defined in the schema
        @reservations = []

        # Grab and add user_name to each reservation
        reservations_array.each do |r|
            user = User.find(r.user_id)
            name = user.name
            res = r.attributes # Converts r into a new hash
            res[:name] = name # Creates a new key-value pair in the hash
            @reservations.push(res)
        end

        # Create new hash and populate it with the flights, airplane and reservations data
        flight_data = {
            flight: flight,
            airplane: airplane,
            reservations: @reservations,
            user: user
        }


        render json: flight_data
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

    private
    
    def flight_params
        params.require(:flight).permit(:origin, :destination, :date, :airplane_id)
    end
end
