class Brand < ActiveRecord::Base
   attr_accessible :name
   has_one :product
   validates :name, presence: true

end
