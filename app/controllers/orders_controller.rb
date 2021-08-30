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
  end
  def order_params
  end
  def set_order
    @order = Order.find(params[:id])
  end
end
