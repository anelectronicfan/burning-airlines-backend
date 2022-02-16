class AirplanesController < ApplicationController

    def new
        @airplane = Airplane.new
    end

    def create
        
        @airplane = Airplane.new airplane_params
        
        @airplane.save
        if @airplane.persisted?
        redirect_to airplanes_path
        else
            render :new
        end
    end

    def index
        @airplanes = Airplane.order(:date).reverse
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
    
    private

    def airplane_params
        params.require(:airplane).permit(:name, :total_rows, :total_columns)
    end

end
