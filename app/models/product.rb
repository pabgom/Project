class Product < ActiveRecord::Base
	before_action :authenticate_user!
	
  belongs_to :Category
end
