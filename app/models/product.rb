class Product < ActiveRecord::Base
  has_many :images, as: :imageable, dependent: :destroy,  :class_name => 'Image'
  belongs_to :brand
  belongs_to :user
  has_many :products_product_items, dependent: :destroy
  has_many :product_items, through: :products_product_items

	attr_accessible :title, :description, :price, :brand_id, :user_id, :category_id, :part_number,
                  :images_attributes, :token, :product_image, :product_items_attributes,
                  :products_product_items_attributes, :sub_category_id, :sub_category_first_id,
                  :sub_category_second_id, :store, :is_active
	accepts_nested_attributes_for :images, :allow_destroy => true
  accepts_nested_attributes_for :products_product_items,
           :reject_if => :all_blank,
           :allow_destroy => true
  accepts_nested_attributes_for :product_items

  # attr_accessible :value, :products_product_items_attributes
  # accepts_nested_attributes_for :products_product_items
  validates :title, :description, :price, :brand_id, :part_number,:product_image, :category_id, presence: true

  mount_uploader :product_image, ImageUploader

  after_create :generate_uniq_id

  STORE = [['New store', 'new_store'], ['Old store', 'old_store']]

  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64
      break random_token unless Product.where(token: random_token).exists?
    end
  end

  protected

  def generate_uniq_id
  	self.uniq_code = "NMI-#{self.combination}"
  	self.save!
  end

  def combination
  	str = ''
  	product_id = self.id.to_s.length
    case product_id
    when 1
      str = "00000#{self.id}"
    when 2
      str = "0000#{self.id}"
    when 3
    	str = "000#{self.id}"
    when 4
    	str = "00#{self.id}"
    when 5
      str = "0#{self.id}"
    when 6
      str = "#{self.id}"
    else
    	str = "#{self.id}"
    end
    return str
  end

end
