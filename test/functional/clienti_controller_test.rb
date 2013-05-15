require 'test_helper'

class ClientiControllerTest < ActionController::TestCase
  setup do
    @cliente = clienti(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clienti)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cliente" do
    assert_difference('Cliente.count') do
      post :create, cliente: { agenzia: @cliente.agenzia, banca: @cliente.banca, cap: @cliente.cap, citta: @cliente.citta, codfis_piva: @cliente.codfis_piva, email: @cliente.email, fax: @cliente.fax, iban: @cliente.iban, note: @cliente.note, provincia: @cliente.provincia, ragione_sociale: @cliente.ragione_sociale, telefono1: @cliente.telefono1, telefono2: @cliente.telefono2, telefono3: @cliente.telefono3, via: @cliente.via }
    end

    assert_redirected_to cliente_path(assigns(:cliente))
  end

  test "should show cliente" do
    get :show, id: @cliente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cliente
    assert_response :success
  end

  test "should update cliente" do
    put :update, id: @cliente, cliente: { agenzia: @cliente.agenzia, banca: @cliente.banca, cap: @cliente.cap, citta: @cliente.citta, codfis_piva: @cliente.codfis_piva, email: @cliente.email, fax: @cliente.fax, iban: @cliente.iban, note: @cliente.note, provincia: @cliente.provincia, ragione_sociale: @cliente.ragione_sociale, telefono1: @cliente.telefono1, telefono2: @cliente.telefono2, telefono3: @cliente.telefono3, via: @cliente.via }
    assert_redirected_to cliente_path(assigns(:cliente))
  end

  test "should destroy cliente" do
    assert_difference('Cliente.count', -1) do
      delete :destroy, id: @cliente
    end

    assert_redirected_to clienti_path
  end
end
