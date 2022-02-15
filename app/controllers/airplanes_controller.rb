class AirplanesController < ApplicationController

    def new
        @airplane = Airplane.new
    end

    def create
        @airplane =Airplane.new airplane_params
    end

    def index
        @airplanes = Airplane.all
    end

    def show
        @airplane = Airplane.find params[:id]
    end

    def edit
        @airplane = Airplane.find params[:id]
    end

    def update
        @airplane = Airplane.find params[:id]
    end

    def destroy
    end
    

end
