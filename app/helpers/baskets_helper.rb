module BasketsHelper

  def current_basket_qty
    current_basket.product_ids.size
  end

  def current_basket
    @current_basket ||= Basket.find_by(user_id: current_user.id)
  end

  def basket_products
    return [] unless current_basket

    @basket_products = []
    current_basket.product_ids.each do |id|
      product = Product.find_by(product_id: id)
      @basket_products << product if product
    end

    @basket_products
  end

end
