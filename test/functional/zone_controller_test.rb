require 'test_helper'

class ZoneControllerTest < ActionController::TestCase
  setup do
    @zone = zone(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:zone)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create zone" do
    assert_difference('Zona.count') do
      post :create, zone: { descrizione: @zone.descrizione }
    end

    assert_redirected_to zone_path(assigns(:zone))
  end

  test "should show zone" do
    get :show, id: @zone
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @zone
    assert_response :success
  end

  test "should update zone" do
    put :update, id: @zone, zone: { descrizione: @zone.descrizione }
    assert_redirected_to zone_path(assigns(:zone))
  end

  test "should destroy zone" do
    assert_difference('Zona.count', -1) do
      delete :destroy, id: @zone
    end

    assert_redirected_to zone_path
  end
end
