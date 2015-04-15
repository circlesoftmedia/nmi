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
                  :hear_from, :security_code, :subscribe_to_updates, :toc, :role,
                  :is_active, :start_date, :end_date, :contact_num_first, :contact_num_second
  validates_presence_of :first_name, :last_name, :company_name, :phone, :mobile

  has_many :products
  after_create :generate_uniq_id
  after_update :update_user_products

  def full_name
    return "#{self.first_name} #{self.last_name}"
  end

  def role?( requested_role )
    self.role == requested_role.to_s
  end

  #this method is called by devise to check for "active" state of the model
  def active_for_authentication?
    #remember to call the super
    #then put our own check to determine "active" state using
    #our own "is_active" column
    super and self.is_active?
  end

  def generate_uniq_id
    self.uniq_id = "#{self.company_name.upcase.at(0..2)}-#{self.id}"
    self.save!
  end

  def update_user_products
    user_products = self.products
    if user_products.count > 0
      if self.is_active?
        user_products.each do |p|
          p.update_attributes(is_active: true)
        end
      else
        user_products.each do |p|
          p.update_attributes(is_active: false)
        end
      end
    end
  end

end
