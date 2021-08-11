# frozen_string_literal: true

class BasketsController < ApplicationController
  before_action :authenticate_user!

  def index
    @baskets = current_user.baskets.order(created_at: :desc)
  end
end
