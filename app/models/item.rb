class Item < ActiveRecord::Base
  belongs_to :user
  
  validates :name, length: { minimum: 3 }, presence: true
  
end
