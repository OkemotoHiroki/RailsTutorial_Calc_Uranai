class CalculationsController < ApplicationController
  def index
    @result = session[:result]
    session.delete(:result)
  end

  def create
    service = CalculationsService.new(calculation_params[:hourly_wage].to_i, calculation_params[:hours_per_years].to_i)
    @result = service.after_tax
    session[:result] = @result
    redirect_to calculations_path
  end
  def calculation_params
    params.require(:calculation).permit(:hourly_wage, :hours_per_years)
  end
end
