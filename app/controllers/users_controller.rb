class UsersController < ApplicationController
    before_action :authenticate_user

    def current
        render json: current_user
    end

    def new
    end

    def create
    end

    def index
    end

    def show
        user = User.find params[:id]
        reservations= user.reservations
        name = user.name

        render json: reservations
       
        # render json: => reservations, :include => {:id} // TODO: uncomment this
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def user_params

    end

    
end
