class ProductItem < ActiveRecord::Base
	attr_accessible :name, :item_type
	has_many :products_product_items
	has_many :products, through: :products_product_items

  validates :name, :item_type, presence: true

	DATA_TYPES = [ ['string', 'string'],['number', 'number'],['multiple value', 'multiple value'] ]



end
