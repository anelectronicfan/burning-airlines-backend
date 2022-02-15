class AirplanesController < ApplicationController

    def new
        @airplane = Airplane.new
    end

    def create
        
        airplane =Airplane.new airplane_params
        if airplane.persisted?
        redirect_to airplanes_path
        else
            render :new
        end
    end

    def index
        airplane = Airplane.all
        render json: airplane
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
        Airplane.destroy params[:id]
        redirect_to airplanes_path
    end
    
    def airplane_params
        params.require(:flight).permit(:name, :total_rows, :total_columns)
    end

end
