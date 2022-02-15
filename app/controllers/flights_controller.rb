class FlightsController < ApplicationController

    skip_before_action :verify_authenticity_token, raise: false

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
