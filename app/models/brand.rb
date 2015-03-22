class Brand < ActiveRecord::Base
   attr_accessible :name
   belongs_to :product
   validates :name, presence: true

end
