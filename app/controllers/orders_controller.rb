# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show]

  def index
    @orders = current_user.orders
  end

  def show; end

  def new
    @order = Order.new
  end

  def create
    @order = current_user.orders.new.build_from_file(params[:order][:basket_data])
    redirect_to @order
  rescue StandardError
    flash[:error] = 'There was an error processing your order, please try again'
    redirect_to new_order_path
  end

  private

  def order_params
    params.require(:order).permit(:basket_data)
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
