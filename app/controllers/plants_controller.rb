class PlantsController < ApplicationController
    before_action :authenticate_user!
    before_action :only_current_user
    
    # GET to /users/:user_id/plants/:id
    def new
        @plant = Plant.new
    end
    
    # POST to /users/:user_id/plants
    def create
       @plant = Plant.new( plant_params )
       @plant.user_id = (current_user.id)
       if @plant.save
           flash[:success] = "Plant created"
           redirect_to user_plants_path(user_id: current_user.id)
       else
           flash[:error] = "Plant creation failed"
           render action: :new
       end
    end
    
    # GET /users/:user_id/plants/:id
    def show
        @plant = Plant.find(params[:id]) 
    end
    
    # PUT to /users/:user_id/plants/:id
    def update
       @plant = Plant.find(params[:id])
       if @plant.update_attributes( plant_params )
           flash[:success] = "Plant updated"
           redirect_to user_plant_path(user_id: params[:user_id], id: params[:id])
       else
           render action: :show
       end
    end
    
    # DELETE to /users/:user_id/plants/:id
    def destroy
       Plant.find(params[:id]).destroy
       redirect_to user_plants_path(user_id: current_user.id)
    end
    
    # GET to /users/:user_id/plants
    def index
       @user = User.find( params[:user_id] )
       @plants = Plant.where("user_id = ?", params[:user_id])
    end
    
    private
        def plant_params
           params.require(:plant).permit(:name, :user_id, :light_id, :plant_date, :last_turn, :growth_stage, :water_level, :description) 
        end
        
        def only_current_user
           @user = User.find( params[:user_id] )
           redirect_to(root_url) unless @user == current_user
        end
end