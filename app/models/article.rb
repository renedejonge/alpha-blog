class Article < ActiveRecord::Base
  belongs_to :user

  # voorbeeld: titel in hoofdletters voordat deze wordt opgeslagen
  # before_save { self.title = title.upcase }
  # of korter, en zonder self
  #before_save { title.upcase! }
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :description, presence: true, length: { minimum: 10, maximum: 300}
  validates :user_id, presence: true
end