class Product < ActiveRecord::Base
  validates_presence_of :title, :description, :image_url, :price
  validates_uniqueness_of :title
  validates_numericality_of :price
  validates_length_of :title, :minimum => 10, :message => "Title must be at least 10 characters."
  
  validate :price_must_be_at_least_a_cent

  validates_format_of :image_url,
    :with => %r{\.(gif|jpg|png)$}i,
    :message => 'must be a URL for GIF, JPG or PNG image.'


  def self.find_products_for_sale 
    find(:all, :order => "title") 
  end 


  protected

  def price_must_be_at_least_a_cent
    errors.add(:price, 'should be at least 0.01') if price.nil? || price <= 0.01
  end
end
