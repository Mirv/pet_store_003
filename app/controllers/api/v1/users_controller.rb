class Api::V1::UsersController < ActionController::API

    def index
        render json: User.all
    end
    
    def user_params
        params.require(:user).permit(:id, :email)
    end
end