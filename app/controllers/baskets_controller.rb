# frozen_string_literal: true

class BasketsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:show, :destroy]

  def index
    @baskets = current_user.baskets.order(created_at: :desc)
  end

  def destroy
    @basket = Basket.find(params[:id])
    @basket.destroy
    flash[:alert] = "Basket was successfully deleted."
    redirect_to baskets_path
  end

  def show
    @basket = Basket.find(params[:id])
    @receipt = Baskets::Receipt.new(@basket)
  end

  def new
    @basket = Basket.new
  end

  def create
    if file_type_allowed?
      @basket = current_user.baskets.new(basket_params.except(:basket_items_file))
      BasketReader.read_basket(basket_params[:basket_items_file]).each do |line_item|
        @basket.line_items << line_item
      end

      if @basket.save
        redirect_to basket_path(@basket.id)
      else
        flash[:error] = @basket.errors.full_messages.map(&:to_s).join(', ')
        redirect_to new_basket_url
      end
    else
      flash[:error] = "File type not allowed."
      redirect_to new_basket_url
    end
  end

  private

  def file_type_allowed?
    params[:basket][:basket_items_file].content_type == 'text/plain'
  end

  def basket_params
    params.require(:basket).permit(:name, :basket_items_file)
  end

  def correct_user
    @basket = current_user.baskets.find_by(id: params[:id])
    redirect_to root_url if @basket.nil?
  end
end
