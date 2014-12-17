class OrderitemsController < ApplicationController
  before_action :set_orderitem, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @orderitems = Orderitem.all
    respond_with(@orderitems)
  end

  def show
    respond_with(@orderitem)
  end

  def new
    @orderitem = Orderitem.new
    respond_with(@orderitem)
  end

  def edit
  end

  def create
    @orderitem = Orderitem.new(orderitem_params)
    @orderitem.save
    respond_with(@orderitem)
  end

  def update
    @orderitem.update(orderitem_params)
    respond_with(@orderitem)
  end

  def destroy
    @orderitem.destroy
    respond_with(@orderitem)
  end

  private
    def set_orderitem
      @orderitem = Orderitem.find(params[:id])
    end

    def orderitem_params
      params.require(:orderitem).permit(:product_id_id, :quantity, :total)
    end
end
