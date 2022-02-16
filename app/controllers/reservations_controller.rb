class ReservationsController < ApplicationController
    
    skip_before_action :verify_authenticity_token, raise: false

    def new
    end

    def create
        # params.permit!
        # binding.pry
        res = Reservation.create! reservation_params

        # if res.persisted?
            render json: res
        # else
        #     render json: {error: 'Could not create reservation'}, status: 422

        # end

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

    private

    def reservation_params
        params.require(:_json).map do |param| 
            param.permit(:seat_row, :seat_column, :flight_id, :user_id)
        end
    end 
end
