require 'test_helper'

class AgentesControllerTest < ActionController::TestCase
  setup do
    @agente = agenti(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:agenti)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create agente" do
    assert_difference('Agente.count') do
      post :create, agente: { cap: @agente.cap, citta: @agente.citta, codfis_piva: @agente.codfis_piva, cognome: @agente.cognome, fax: @agente.fax, nome: @agente.nome, provincia: @agente.provincia, provvigione: @agente.provvigione, telefono1: @agente.telefono1, telefono2: @agente.telefono2, telefono3: @agente.telefono3, via: @agente.via }
    end

    assert_redirected_to agente_path(assigns(:agente))
  end

  test "should show agente" do
    get :show, id: @agente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @agente
    assert_response :success
  end

  test "should update agente" do
    put :update, id: @agente, agente: { cap: @agente.cap, citta: @agente.citta, codfis_piva: @agente.codfis_piva, cognome: @agente.cognome, fax: @agente.fax, nome: @agente.nome, provincia: @agente.provincia, provvigione: @agente.provvigione, telefono1: @agente.telefono1, telefono2: @agente.telefono2, telefono3: @agente.telefono3, via: @agente.via }
    assert_redirected_to agente_path(assigns(:agente))
  end

  test "should destroy agente" do
    assert_difference('Agente.count', -1) do
      delete :destroy, id: @agente
    end

    assert_redirected_to agenti_path
  end
end
