# encoding: utf-8
require 'test_helper'

class ModelliControllerTest < ActionController::TestCase
  setup do
    @modello = modelli(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:modelli)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create modello" do
    assert_difference('Modello.count') do
      post :create, modello: { descrizione: @modello.descrizione }
    end

    assert_redirected_to modello_path(assigns(:modello))
  end

  test "should show modello" do
    get :show, id: @modello
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @modello
    assert_response :success
  end

  test "should update modello" do
    put :update, id: @modello, modello: { descrizione: @modello.descrizione }
    assert_redirected_to modello_path(assigns(:modello))
  end

  test "should destroy modello" do
    assert_difference('Modello.count', -1) do
      delete :destroy, id: @modello
    end

    assert_redirected_to modelli_path
  end
end
