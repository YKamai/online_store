class Basket
  include Mongoid::Document
  include Mongoid::Timestamps
  field :product_ids, type: Array, default: []

  belongs_to :user
end
