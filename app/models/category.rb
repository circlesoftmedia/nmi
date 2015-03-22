class Category < ActiveRecord::Base
	attr_accessible :name, :image_attributes, :parent_id
  has_one :image, as: :imageable, dependent: :destroy,  :class_name => 'Image'
	accepts_nested_attributes_for :image, :reject_if => lambda { |t| t[:image].nil?}, :allow_destroy => true


	def parent_category_name
		Category.where(:id=>self.parent_id).first.name unless self.parent_id.nil?
	end
end
