class BasketsController < ApplicationController
  def add
    basket = current_basket
    unless basket
      basket = Basket.new(user_id: current_user.id)
      basket.save
    end

    basket.product_ids << params[:product_id] if params[:product_id]

    respond_to do |format|
      if basket.save
        format.html { redirect_to products_path }
        format.js {}
      end
    end

  end

  def destroy
    basket = current_basket
    basket.product_ids = []

    respond_to do |format|
      if basket.save
        format.html { redirect_to '/basket' }
        format.js {}
      end
    end
  end

  def show
    @basket_products = basket_products
  end
end
