class CarsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @car = @user.cars.create(car_params)
    redirect_to user_path(@user)
  end


  def destroy
    @user = User.find(params[:user_id])
    @car = @user.cars.find(params[:id])
    @car.destroy
    redirect_to user_path(@user)
  end

  private def car_params
  params.require(:car).permit(:brand,:model)
end
end
