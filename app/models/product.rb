class Product < ActiveRecord::Base	
  belongs_to :Category
	has_many :orderitem
	has_attached_file :Img_url, :styles => { :medium => "300x300>", :thumb => "100x100>" },
	:url => '/assets/products/:attachment/:id/:style/:basename.:extension',
	:path => ':rails_root/public/assets/products/:attachment/:id/:style/:basename.:extension',
	:default => "/images/default_image/missing.png"
	
	validates_attachment_presence :Img_url
	validates_attachment_size :Img_url, :less_than => 5.megabytes 
	validates_attachment_content_type :Img_url, :content_type => ['image/jpeg', 'image/png']
	
	
	
	def self.search(name, category)
		where(["Name like ? and Category_id = ?", "%#{name}%", category]) 
	end
	
	def self.searchName(query)
		where("Name like ?", "%#{query}%") 
	end
	def self.searchCategory(query)
		where("Category_id = ?", query) 
	end
end
