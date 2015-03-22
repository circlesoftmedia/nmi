class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :first_name, :last_name, :company_name, :phone, :mobile, :address_1,
                  :address_2, :city, :state, :country, :business_type, :user_type,
                  :hear_from, :security_code, :subscribe_to_updates, :toc, :role
  validates_presence_of :first_name, :last_name, :company_name, :phone, :mobile

  has_many :products

  def full_name
    return "#{self.first_name} #{self.last_name}"
  end
end
