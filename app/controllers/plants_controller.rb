class PlantsController < ApplicationController
    # GET to /users/:user_id/plants/:id
    def new
        @plant = Plant.new
    end
end