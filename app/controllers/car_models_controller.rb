class CarModelsController < ApplicationController
    def index
        @car_models = CarModel.all
    end

    def show
        @car_model = CarModel.find(params[:id]) # params é um HASH
    end

    def new
        @car_model = CarModel.new
        @car_categories = CarCategory.all
    end

    def create
    end

end