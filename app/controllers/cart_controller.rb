class CartController < ApplicationController
	before_filter :authenticate_user!
	
	def clearcart
		# set the session variable to nil and redirect		
		puts '------------------------------------------------Clear'
		puts session["cart"]
		session["cart"] = nil
		redirect_to :action => :index
 	end
	
	def add
		puts '------------------------------------------------ADD'
		puts session["cart"]
 		id = params[:id]
		cart = session["cart"] || {}
		
 		if cart[id] then
			cart[id] = cart[id] + 1
		else
			cart[id] = 1
		end
			
			session["cart"] = cart
			puts cart
		# redirect to the cart display page
 		redirect_to :action => :index
 	end #end add method
 
	
	def remove
    cart = session[:cart]
    newCart = {}
    cart.each do |item_id|
      if !(item_id == params[:id])
        newCart = newCart.push(item_id)
      end
    end
    session[:cart] = {}
    session[:cart] = newCart
    redirect_to :action => :index
  end

  def removeAll
    session["cart"] = {}
    redirect_to :action => :index
  end		
			
			
	def index		
		# if there is a cart, pass it to the page for display
		# else pass an empty value
		#session["cart"] = {} 
		if session["cart"] then
			@cart = session["cart"]
		else
			@cart = {}
		end
 	end
		
	def success
		if session[:cart] == nil or session[:cart] == {}
			redirect_to :action => :index
		end 
		cart = session[:cart]
		
		order = Order.new
		order.user_id = current_user.id
    total = 0
		order.save
		
		orderitem = Orderitem.new
		orderitem.total = 10
		puts orderitem
		
		cart.each do |item_id, quantity|						
			product = Product.find_by_id(item_id)			
			puts product.id
			total += product.Price * quantity
			orderitem = Orderitem.new
			orderitem.product_id = product.id
			orderitem.quantity = quantity
			orderitem.total = product.Price * quantity
			orderitem.order_id = order.id      
      orderitem.save			
		end
		
		order.total = total
		order.save
		
		session["cart"] = {}
	end		
    #total = 0
    ##User = User.where("id == ?",user_signed_in.object_id)
			#order = Order.new
			#order.user_id = current_user
    	#total = 0
			#order.save
			
    #cart.each do |item_id, quantity|
			#product = Product.find_by_id(item_id)
      #total += product.price
			#orderitem = Orderitem.new
			#orderitem.product_id = product.id
			#orderitem.quantity = quantity
			#orderitem.total = product.Price * quantity
			#ordenitem.order_id = order.id      
      #orderitem.save
    #end

    #transaction = Transactions.find_by_id(transaction)
    #transaction.import = total
    #transaction.save

    #session["cart"] = {}
    #current_user = User.find(1)

    #order = Order.new()
    #order.user = current_user
    #order.save
  #end
		
end