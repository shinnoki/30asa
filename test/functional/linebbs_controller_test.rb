require 'test_helper'

class LinebbsControllerTest < ActionController::TestCase
  setup do
    @linebb = linebbs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:linebbs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create linebb" do
    assert_difference('Linebb.count') do
      post :create, linebb: { author: @linebb.author, text: @linebb.text }
    end

    assert_redirected_to linebb_path(assigns(:linebb))
  end

  test "should show linebb" do
    get :show, id: @linebb
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @linebb
    assert_response :success
  end

  test "should update linebb" do
    put :update, id: @linebb, linebb: { author: @linebb.author, text: @linebb.text }
    assert_redirected_to linebb_path(assigns(:linebb))
  end

  test "should destroy linebb" do
    assert_difference('Linebb.count', -1) do
      delete :destroy, id: @linebb
    end

    assert_redirected_to linebbs_path
  end
end
