class FlightsController < ApplicationController
    def new
    end

    def create
    end

    def index
        render json: Flight.all
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
    end
    
end
