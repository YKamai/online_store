require 'nokogiri'
require 'mongoid'
require_relative 'app/models/product'

class DataHelper
	def self.parse_products_from_xml
		path = ENV['PRODUCT_DATA_FILES_PATH']
		return [] if path.blank?

		docs = self.docs_from_folder(path)
		self.parse_product_docs(docs)
	end

	def self.load_products(products)
		existing_product_ids = Product.all.pluck(:product_id)
		products.each do |product|
			next if existing_product_ids.include?(product.product_id)
			product.save!
		end
	end

	private

	def self.docs_from_folder(path, ext = '.xml')
		paths = Dir["#{path}/*#{ext}"]
		docs = []

		paths.each do |file_path|
		  docs << {
		      id: File.basename(file_path, '.xml').to_i,
		      doc: File.open(file_path) { |f| Nokogiri::XML(f) }
		  }
		end

		docs
	end

	def self.parse_product_docs(docs)
		products = []

		docs.each do |h|
		  product_id = h[:id]
		  name = h[:doc].at_xpath('item')['name']
		  price = h[:doc].at_xpath('item/price').content
		  manufacturer = h[:doc].at_xpath('item/manufacturer').content

		  products << Product.new(
		  	product_id: product_id,
		  	name: name,
		  	price: price,
		  	manufacturer: manufacturer
		  )
		end

		products
	end
end


