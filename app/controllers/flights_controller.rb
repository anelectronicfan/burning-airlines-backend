class FlightsController < ApplicationController
    def new
        @flight = Flight.new
    end

    def create
        @flight = Flight.new flight_params

    end

    def index
        render json: Flight.all
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
