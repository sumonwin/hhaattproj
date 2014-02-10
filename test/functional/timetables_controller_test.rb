require 'test_helper'

class TimetablesControllerTest < ActionController::TestCase
  setup do
    @timetable = timetables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:timetables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create timetable" do
    assert_difference('Timetable.count') do
      post :create, timetable: { classname: @timetable.classname, duration: @timetable.duration, endtime: @timetable.endtime, friday: @timetable.friday, jplevel: @timetable.jplevel, monday: @timetable.monday, saturaday: @timetable.saturaday, school: @timetable.school, startdate: @timetable.startdate, starttime: @timetable.starttime, sunday: @timetable.sunday, thursday: @timetable.thursday, tuesday: @timetable.tuesday, wednesday: @timetable.wednesday }
    end

    assert_redirected_to timetable_path(assigns(:timetable))
  end

  test "should show timetable" do
    get :show, id: @timetable
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @timetable
    assert_response :success
  end

  test "should update timetable" do
    put :update, id: @timetable, timetable: { classname: @timetable.classname, duration: @timetable.duration, endtime: @timetable.endtime, friday: @timetable.friday, jplevel: @timetable.jplevel, monday: @timetable.monday, saturaday: @timetable.saturaday, school: @timetable.school, startdate: @timetable.startdate, starttime: @timetable.starttime, sunday: @timetable.sunday, thursday: @timetable.thursday, tuesday: @timetable.tuesday, wednesday: @timetable.wednesday }
    assert_redirected_to timetable_path(assigns(:timetable))
  end

  test "should destroy timetable" do
    assert_difference('Timetable.count', -1) do
      delete :destroy, id: @timetable
    end

    assert_redirected_to timetables_path
  end
end
