class Product < ActiveRecord::Base
  validates_presence_of :title, :price
  validates_uniqueness_of :title
  validates_numericality_of :price
end
