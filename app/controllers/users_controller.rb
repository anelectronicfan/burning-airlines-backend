class UsersController < ApplicationController
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
       
        render json: => reservations, :include => {:id, :}
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
