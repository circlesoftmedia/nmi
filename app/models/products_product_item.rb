class ProductsProductItem < ActiveRecord::Base
  attr_accessible :value, :product_item_attributes
  belongs_to :product
  belongs_to :product_item
  validates :value, presence: true

  accepts_nested_attributes_for :product_item, :reject_if => :reject_product_item, :allow_destroy => true

  def reject_product_item(attributes)
    exists = attributes['name'].present? && attributes['item_type'].present?
    if exists
      item_exist = ProductItem.where(name: attributes['name'], item_type: attributes['item_type']).first
      attributes.merge!({:_destroy => 1}) unless item_exist.blank?
      self.product_item_id = item_exist.id unless item_exist.blank?
    end
  end

end
