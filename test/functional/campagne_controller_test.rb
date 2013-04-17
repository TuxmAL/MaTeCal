# encoding: utf-8
require 'test_helper'

class CampagneControllerTest < ActionController::TestCase
  setup do
    @campagna = campagne(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:campagne)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create campagna" do
    assert_difference('Campagna.count') do
      post :create, campagna: { descrizione: @campagna.descrizione }
    end

    assert_redirected_to campagna_path(assigns(:campagna))
  end

  test "should show campagna" do
    get :show, id: @campagna
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @campagna
    assert_response :success
  end

  test "should update campagna" do
    put :update, id: @campagna, campagna: { descrizione: @campagna.descrizione }
    assert_redirected_to campagna_path(assigns(:campagna))
  end

  test "should destroy campagna" do
    assert_difference('Campagna.count', -1) do
      delete :destroy, id: @campagna
    end

    assert_redirected_to campagne_path
  end
end
