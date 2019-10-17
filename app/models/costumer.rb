class Costumer < ActiveRecord::Base
  has_many :products
  # belongs to user
  # belongs_to :user
end
