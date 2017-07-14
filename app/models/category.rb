class Category < ActiveRecord::Base
  # validates :name, presence: true
  # validates_uniqueness_of :name
  # validates :name, length: { minimum: 3 }
  # validates :name, length: { maximum: 25 }

  # validates :name, presence: true, length: { minimum: 3, maximum: 25}
  # validates_uniqueness_of :name

  # Vreemde syntax voor validatie van uniqueness vergelijken met de rest. Maar onderstaande werkt ook.
  # validates :name, presence: true, length: { minimum: 3, maximum: 25}, uniqueness: true
  
  # En onderstaande werkt ook
  # validates :name, uniqueness: true
  # validates_presence_of :name
  # validates_length_of :name, minimum: 3, maximum: 25

  validates :name, presence: true, length: { minimum: 3, maximum: 25}, uniqueness: true

end