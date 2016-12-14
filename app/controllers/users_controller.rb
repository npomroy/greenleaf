class UsersController < ApplicationController
    before_action :authenticate_user!
    
    # GET /users/:id
    def show
       @user = User.find(params[:id]) 
    end
    
    # GET /users
    def index
       @users = User.includes(:profile) 
    end
    
    # GET /garden
    def garden
       @user = current_user
       @plants = Plant.where("user_id = ?", current_user.id)
       @lights = Light.where("user_id = ?", current_user.id)
    end
end