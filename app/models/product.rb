class Product < ActiveRecord::Base
  has_many :images, as: :imageable, dependent: :destroy,  :class_name => 'Image'
  has_one :brand
  belongs_to :user
  has_many :products_product_items, dependent: :destroy
  has_many :product_items, through: :products_product_items

	attr_accessible :title, :description, :price, :brand_id, :user_id, :category_id, :part_number,
                  :images_attributes, :token, :product_image, :product_items_attributes, :products_product_items_attributes
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


  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64
      break random_token unless Product.where(token: random_token).exists?
    end
  end

  protected

  def generate_uniq_id
  	self.uniq_code = "#{self.title.upcase.at(0..3)}-#{self.combination}"
  	self.save!
  end

  def combination
  	str = ''
  	product_id = self.id.to_s.length
    case product_id
    when 1
      str = "000#{self.id}"
    when 2
      str = "00#{self.id}"
    when 3
    	str = "0#{self.id}"
    when 4
    	str = "#{self.id}"
    else
    	puts 'Product Id not found!!'
    end
    return str
  end

end
