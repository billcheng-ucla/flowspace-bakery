class CookiesController < ApplicationController
  before_action :authenticate_user!

  def new
    @oven = current_user.ovens.find_by!(id: params[:oven_id])
    if @oven.cookies.size > 0
      redirect_to @oven, alert: "#{pluralize(@oven.cookies.size, "cookie")} #{"is".pluralize(@oven.cookies.size)} already in the oven!"
    else
      @cookie = @oven.cookies.build
    end
  end

  def create

    @oven = current_user.ovens.find_by!(id: params[:oven_id])
    for i in 0...cookie_params[:quantity].to_i
      @cookie = @oven.cookies.create(fillings: cookie_params[:fillings])
    end
    redirect_to oven_path(@oven)
  end

  private

  def cookie_params
    params.require(:cookie).permit(:fillings, :quantity)
  end

end
