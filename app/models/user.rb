class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self
  
  before_save :downcase_email
  before_create :generate_confirmation_instructions

  def downcase_email
    self.email = self.email.delete(' ').downcase
  end
  
  def generate_confirmation_instructions
    #self.confirmation_token = SecureRandom.hex(10)
    self.confirmation_sent_at = Time.now.utc
  end
end
