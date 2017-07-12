class User < ActiveRecord::Base
  has_many :articles, dependent: :destroy
  
  ###before_save { self.email = email.downcase! } slaat email nil op in de database ondanks onderstaande validatie
  ###before_save { self.email = email.downcase } is wel goed
  ###before_save { email.downcase! } is ook goed
  before_save { self.email = email.downcase }

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }
  
  # VALID_EMAIL_REGEX= moet boven de validates regel die deze gebruikt staan! Want anders uninitialized constant foutmelding!
  VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 105 }, format: { with: VALID_EMAIL_REGEX }

  has_secure_password
end