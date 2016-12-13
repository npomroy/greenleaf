class PlantsController < ApplicationController
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
           redirect_to root_path
       else
           flash[:error] = "Plant creation failed"
           render action: :new
       end
    end
    
    private
        def plant_params
           params.require(:plant).permit(:name, :user_id, :light_id, :plant_date, :last_turn, :growth_stage, :water_level, :description) 
        end
end