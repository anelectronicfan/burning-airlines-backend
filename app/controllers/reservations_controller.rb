class ReservationsController < ApplicationController
    def new
    end

    def create
    end

    def index
       reservations = Reservation.all
        render json: reservations 
    end

    def show
        
    end

    def edit
    end

    def update
    end

    def destroy
    end
    
end
