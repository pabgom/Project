class HomeController < ApplicationController
	require 'Personal_log'
	#layout :layout_Home #'application'
	
  def index
  end
	
	
	def search
		@Categories = Category.all
		
		@products = Product.all
		searchname = ''
		searchcategory = ''
		email = ''		
		if params[:searchProduct] and params["get"][:SearchCategory] != ''
			@products = @products.search(params[:searchProduct], params["get"][:SearchCategory])
			searchname = params[:searchProduct]
			searchcategory =	params["get"][:SearchCategory]
			elsif params[:searchProduct] != ''
			@products = @products.searchName(params[:searchProduct])
			searchname = params[:searchProduct]
			elsif params["get"][:SearchCategory] != ''
			@products = @products.searchCategory(params[:searchProduct], params["get"][:SearchCategory])
			searchcategory =	params["get"][:SearchCategory]
		end
		if user_signed_in?
			email = current_user.email
		end
		
		p1 = ::Personal_Log.new("search_data.txt")
		p1.recordSearch(email,searchname,searchcategory,Date.current.to_s)
	end
	
	
# 	private	
# 	def layout_Home
# 		# Do stuff here…
#    	"application"
# 	end
end