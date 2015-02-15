class Category < ActiveRecord::Base
	attr_accessible :name, :image_attributes, :parent_id
    has_one :image, as: :imageable, dependent: :destroy
	accepts_nested_attributes_for :image
    

	def parent_category_name
		Category.where(:parent_id=>self.parent_id).first.try(:name)
	end
end
