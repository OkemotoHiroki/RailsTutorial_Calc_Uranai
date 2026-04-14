class FortunesController < ApplicationController
  def index
    @rank = nil
    @lucky_color = nil
  end

  def create
    service = FortunesService.new(fortune_params[:birthday].to_i)
    @birthmonth = fortune_params[:birthday].to_i
    @rank = service.get_rank(fortune_params[:birthday].to_i)
    @lucky_color = service.get_lucky_color
    @ranking_list = service.get_ranking_list
    render :index
  end

  private

  def fortune_params
    params.require(:fortune).permit(:birthday)
  end
end
