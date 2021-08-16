# frozen_string_literal: true

class BasketsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:show, :destroy]
  before_action :check_no_file, :check_file_type, only: [:create]

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
    @basket = current_user.baskets.new(basket_params.except(:basket_file))
    @basket.add_items(basket_params[:basket_file])

    if @basket.save
      redirect_to basket_path(@basket.id)
    else
      flash[:error] = @basket.errors.full_messages.map(&:to_s).join(', ')
      redirect_to new_basket_url
    end
  end

  private

  def basket_params
    params.require(:basket).permit(:name, :basket_file)
  end

  def correct_user
    @basket = current_user.baskets.find_by(id: params[:id])
    redirect_to root_url if @basket.nil?
  end

  def check_no_file
    if basket_params[:basket_file].nil?
      flash[:error] = 'Please select a file to upload.'
      redirect_to new_basket_path
    end
  end

  def check_file_type
    if BasketReader.file_type_not_allowed?(basket_params[:basket_file])
      flash[:error] = 'File type not allowed.'
      redirect_to new_basket_path
    end
  end
end
