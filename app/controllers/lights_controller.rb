class LightsController < ApplicationController
   # GET to /users/:user_id/lights/:id
   def new
       @light = Light.new
   end
   
   # POST to /users/:user_id/plants
   def create
      @light = Light.new( light_params )
      @light.user_id = ( params[:user_id] )
      if @light.save
          flash[:success] = "Light created"
          redirect_to user_plants_path
      else
          flash[:error] = "Light creation failed"
          render action: :new
      end
   end
   
   # GET to /users/:user_id/lights
   def index
      @user = User.find( params[:user_id] )
      @lights = Light.where("user_id = ?", params[:user_id])
   end
   
   private
        def light_params
           params.require(:light).permit(:name, :user_id, :light_level, :power_usage, :description) 
        end
end