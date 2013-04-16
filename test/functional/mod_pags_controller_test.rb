require 'test_helper'

class ModPagsControllerTest < ActionController::TestCase
  setup do
    @mod_pag = mod_pags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mod_pags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mod_pag" do
    assert_difference('ModPag.count') do
      post :create, mod_pag: { descrizione: @mod_pag.descrizione, dilazione_iniziale: @mod_pag.dilazione_iniziale }
    end

    assert_redirected_to mod_pag_path(assigns(:mod_pag))
  end

  test "should show mod_pag" do
    get :show, id: @mod_pag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mod_pag
    assert_response :success
  end

  test "should update mod_pag" do
    put :update, id: @mod_pag, mod_pag: { descrizione: @mod_pag.descrizione, dilazione_iniziale: @mod_pag.dilazione_iniziale }
    assert_redirected_to mod_pag_path(assigns(:mod_pag))
  end

  test "should destroy mod_pag" do
    assert_difference('ModPag.count', -1) do
      delete :destroy, id: @mod_pag
    end

    assert_redirected_to mod_pags_path
  end
end
