class VetsController < ApplicationController
    
    def index
        @vets = Vet.all
    end

    def new
        @vet = Vet.new
    end

    def create
        @vet = Vet.new

        @vet.attributes = vet_params
        # byebug
        if @vet.valid?
            @vet.save
            log_in(@vet)
            redirect_to vets_url
        else
            flash[:notice] = "Something went wrong. Please enter valid info."
            render :new
        end
    end


    private

    def vet_params
        params.require(:vet).permit(:first_name, :last_name, :email, :password, :password_confirmation, :clinic_id)
    end
end
