require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { NRCNumber: @user.NRCNumber, address: @user.address, date_of_entry: @user.date_of_entry, dob: @user.dob, gender: @user.gender, leaveday: @user.leaveday, name: @user.name, normaltravelfee: @user.normaltravelfee, phone: @user.phone, team: @user.team, userid: @user.userid, year_of_entry: @user.year_of_entry }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    put :update, id: @user, user: { NRCNumber: @user.NRCNumber, address: @user.address, date_of_entry: @user.date_of_entry, dob: @user.dob, gender: @user.gender, leaveday: @user.leaveday, name: @user.name, normaltravelfee: @user.normaltravelfee, phone: @user.phone, team: @user.team, userid: @user.userid, year_of_entry: @user.year_of_entry }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
