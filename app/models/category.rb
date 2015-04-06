class Category < ActiveRecord::Base
	attr_accessible :name, :image_attributes, :parent_id, :ancestry
  has_one :image, as: :imageable, dependent: :destroy,  :class_name => 'Image'
	accepts_nested_attributes_for :image, :reject_if => lambda { |t| t[:image].nil?}, :allow_destroy => true

  has_ancestry

	def self.get_all_parent
		where(:ancestry => nil)
	end

  def self.get_all_sub_categories
    sub_cat = []
    cat = self.where(:ancestry => nil)
    cat.each do |sub|
      sub_cat << sub.children
    end
    return sub_cat.flatten
  end

  def self.get_all_sub_categories_level_1
    sub_cat = []
    sub_cat_1 = []
    cat = self.where(:ancestry => nil)
    cat.each do |sub|
      sub_cat << sub.children
    end
    sub_cat.flatten.each do |sub_1|
      sub_cat_1 << sub_1.children
    end

    return sub_cat_1.flatten
  end

  def self.get_all_sub_categories_level_1
    sub_cat = []
    sub_cat_1 = []
    cat = self.where(:ancestry => nil)
    cat.each do |sub|
      sub_cat << sub.children
    end
    sub_cat.flatten.each do |sub_1|
      sub_cat_1 << sub_1.children
    end
    return sub_cat_1.flatten
  end

  def self.get_all_sub_categories_level_2
    sub_cat = []
    sub_cat_1 = []
    sub_cat_2 = []
    cat = self.where(:ancestry => nil)
    cat.each do |sub|
      sub_cat << sub.children
    end
    sub_cat.flatten.each do |sub_1|
      sub_cat_1 << sub_1.children
    end
    sub_cat_1.flatten.each do |sub_2|
      sub_cat_2 << sub_2.children
    end
    return sub_cat_2.flatten
  end

  # def get_root_category

  # end

  # def get_children
  # end

  # def get_all_children
  # end
end
