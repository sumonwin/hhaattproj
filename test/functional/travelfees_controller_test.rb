require 'test_helper'

class TravelfeesControllerTest < ActionController::TestCase
  setup do
    @travelfee = travelfees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:travelfees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create travelfee" do
    assert_difference('Travelfee.count') do
      post :create, travelfee: { classname: @travelfee.classname, date: @travelfee.date, travel_fee: @travelfee.travel_fee, userid: @travelfee.userid }
    end

    assert_redirected_to travelfee_path(assigns(:travelfee))
  end

  test "should show travelfee" do
    get :show, id: @travelfee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @travelfee
    assert_response :success
  end

  test "should update travelfee" do
    put :update, id: @travelfee, travelfee: { classname: @travelfee.classname, date: @travelfee.date, travel_fee: @travelfee.travel_fee, userid: @travelfee.userid }
    assert_redirected_to travelfee_path(assigns(:travelfee))
  end

  test "should destroy travelfee" do
    assert_difference('Travelfee.count', -1) do
      delete :destroy, id: @travelfee
    end

    assert_redirected_to travelfees_path
  end
end
