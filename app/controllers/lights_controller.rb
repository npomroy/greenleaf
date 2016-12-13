class LightsController < ApplicationController
   # GET to /users/:user_id/lights/:id
   def new
       @light = Light.new
   end
end