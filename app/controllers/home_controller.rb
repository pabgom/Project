class HomeController < ApplicationController
	#layout :layout_Home #'application'
	
  def index
  end
	
	
	def search
		#@products = Product.all
		#User.where(users[:name].matches("%#{user_name}%"))
		#@products= Product.where(Name.matches("%Tes%"))
		
		puts session[:cart]
		
		@carro = session[:cart]
		
		@Categories = Category.all
		
		@products = Product.all
		
		#if params[:searchProduct]
			#@products = @products.search(params[:searchProduct], 0)		
		#end
		
		#if params[:SearchCategory]
			#@products = SearchCategory.searchCategory(params[:SearchCategory])
		#end
		@jjooii = params[:SearchCategory]
		
		
		#@products = FilterProduct
		
		#@prueba = params[:searchProduct]
		
		#@products = Product.search(params[:searchProduct])
		#.where(Name: 'Test pro%')
	end
	
	
# 	private	
# 	def layout_Home
# 		# Do stuff here…
#    	"application"
# 	end
end