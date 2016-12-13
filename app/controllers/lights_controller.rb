class LightsController < ApplicationController
    before_action :authenticate_user!
    before_action :only_current_user
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
   
   # DELETE to /users/:user_id/lights/:id
   def destroy
      Light.find(params[:id]).destroy
      redirect_to user_plants_path(params[:user_id])
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
        
        def only_current_user
           @user = User.find( params[:user_id] )
           redirect_to(root_url) unless @user == current_user
        end
end