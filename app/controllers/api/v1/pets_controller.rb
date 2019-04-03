class Api::V1::PetsController < ActionController::API

    def index
        render json: Pet.all
    end
    
    def show
      pet = Pet.find(params[:id])
      render json: pet
    end
    
    def create
        fruit = Fruit.create(fruit_params)
        render json: fruit
    end
    def user_params
        params.require(:pet).permit(:id, :name, :description, :age, :pet_breed_id, :location_id, :user_id, :status)
    end
end