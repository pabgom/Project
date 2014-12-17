class HomeController < ApplicationController
	#layout :layout_Home #'application'
	
  def index
  end
	
	
	def search
		#@products = Product.all
		#User.where(users[:name].matches("%#{user_name}%"))
		#@products= Product.where(Name.matches("%Tes%"))
		#session['cart'] = {}
		#puts '------------------------------------------Para'
	#puts session["cart"] 
		#puts  params
		#puts  params["get"][:SearchCategory]
		
		#@carro = session["cart"]
		
		@Categories = Category.all
		
		@products = Product.all
		
		if params[:searchProduct] and params["get"][:SearchCategory] != ''
			@products = @products.search(params[:searchProduct], params["get"][:SearchCategory])
			puts '---1'
			elsif params[:searchProduct] != ''
			@products = @products.searchName(params[:searchProduct])
			puts '---2'
			elsif params["get"][:SearchCategory] != ''
			@products = @products.searchCategory(params[:searchProduct], params["get"][:SearchCategory])
			puts '---3'			
		end
		
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