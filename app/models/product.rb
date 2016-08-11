class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  field :product_id, type: Integer
  field :name, type: String
  field :price, type: Integer
  field :manufacturer, type: String
end
