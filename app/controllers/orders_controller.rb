class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @orders = Order.all
    respond_with(@orders)
  end

  def show
    respond_with(@order)
  end

  def new
    @order = Order.new
    respond_with(@order)
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    @order.save
    respond_with(@order)
  end

  def update
    @order.update(order_params)
    respond_with(@order)
  end

  def destroy
    @order.destroy
		
		redirect_to :action => :my_orders
    respond_with(@order)
  end
	
	def my_orders
		@orders = Order.where("user_id = ?", current_user.id)
	end

	def detail
		@order = Order.find(params[:id])
	end
	
  private
    def set_order
      @order = Order.find(params[:id])
			
			
    end

    def order_params
      params.require(:order).permit(:user_id_id, :total)
    end
end
