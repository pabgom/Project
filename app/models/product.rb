class Product < ActiveRecord::Base	
  belongs_to :Category
	has_attached_file :Img_url, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default => "/images/default_image/missing.png"
	validates_attachment_content_type :Img_url, :content_type => /\Aimage\/.*\Z/
	
end
