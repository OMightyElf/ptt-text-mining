require 'test_helper'

class ChartsControllerTest < ActionController::TestCase
  setup do
    @chart = charts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:charts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chart" do
    assert_difference('Chart.count') do
      post :create, chart: {  }
    end

    assert_redirected_to chart_path(assigns(:chart))
  end

  test "should show chart" do
    get :show, id: @chart
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chart
    assert_response :success
  end

  test "should update chart" do
    patch :update, id: @chart, chart: {  }
    assert_redirected_to chart_path(assigns(:chart))
  end

  test "should destroy chart" do
    assert_difference('Chart.count', -1) do
      delete :destroy, id: @chart
    end

    assert_redirected_to charts_path
  end
end
