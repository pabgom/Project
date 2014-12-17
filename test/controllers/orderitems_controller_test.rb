require 'test_helper'

class OrderitemsControllerTest < ActionController::TestCase
  setup do
    @orderitem = orderitems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orderitems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create orderitem" do
    assert_difference('Orderitem.count') do
      post :create, orderitem: { product_id_id: @orderitem.product_id_id, quantity: @orderitem.quantity, total: @orderitem.total }
    end

    assert_redirected_to orderitem_path(assigns(:orderitem))
  end

  test "should show orderitem" do
    get :show, id: @orderitem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @orderitem
    assert_response :success
  end

  test "should update orderitem" do
    patch :update, id: @orderitem, orderitem: { product_id_id: @orderitem.product_id_id, quantity: @orderitem.quantity, total: @orderitem.total }
    assert_redirected_to orderitem_path(assigns(:orderitem))
  end

  test "should destroy orderitem" do
    assert_difference('Orderitem.count', -1) do
      delete :destroy, id: @orderitem
    end

    assert_redirected_to orderitems_path
  end
end
