# frozen_string_literal: true

class BasketsController < ApplicationController
  before_action :authenticate_user!

  def index
    @baskets = current_user.baskets.order(created_at: :desc)
  end

  def destroy
    @basket = Basket.find(params[:id])
    @basket.destroy
    flash[:alert] = "Basket was successfully deleted."
    redirect_to baskets_path
  end
end
