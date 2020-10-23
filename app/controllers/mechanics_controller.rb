class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    if Ride.exists?(id: params[:search])
      @mechanic.rides << Ride.find_by(id: params[:search])
    else
      flash[:notice] = "No rides with that id"
    end
  end

  private
def mechanics_params
  params.permit(:name, :years_of_experience)
end

def ride_params
  params.require(:rides).permit(:id)
end

end
