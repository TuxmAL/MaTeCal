require 'test_helper'

class CausaliControllerTest < ActionController::TestCase
  setup do
    @causale = causali(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:causali)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create causale" do
    assert_difference('Causale.count') do
      post :create, causale: { descrizione: @causale.descrizione }
    end

    assert_redirected_to causalo_path(assigns(:causale))
  end

  test "should show causale" do
    get :show, id: @causale
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @causale
    assert_response :success
  end

  test "should update causale" do
    put :update, id: @causale, causale: { descrizione: @causale.descrizione }
    assert_redirected_to causalo_path(assigns(:causale))
  end

  test "should destroy causale" do
    assert_difference('Causale.count', -1) do
      delete :destroy, id: @causale
    end

    assert_redirected_to causali_path
  end
end
