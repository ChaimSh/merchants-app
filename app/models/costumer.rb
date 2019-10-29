class Costumer < ActiveRecord::Base
  has_many :products
   validates :email, :name, uniqueness: true
end
