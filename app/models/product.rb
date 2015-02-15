class Product < ActiveRecord::Base
	attr_accessible :title, :description, :price, :brand_name, :part_number
end
