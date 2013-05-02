class ProdottiController < ApplicationController
  # GET /prodotti
  # GET /prodotti.json
  def index
    @prodotti = Prodotto.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @prodotti }
    end
  end

  # GET /prodotti/1
  # GET /prodotti/1.json
  def show
    @prodotto = Prodotto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @prodotto }
    end
  end

  # GET /prodotti/new
  # GET /prodotti/new.json
  def new
    @prodotto = Prodotto.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @prodotto }
    end
  end

  # GET /prodotti/1/edit
  def edit
    @prodotto = Prodotto.find(params[:id])
  end

  # POST /prodotti
  # POST /prodotti.json
  def create
    @prodotto = Prodotto.new(params[:prodotto])

    respond_to do |format|
      if @prodotto.save
        format.html { redirect_to @prodotto, notice: 'Prodotto creato con successo.' }
        format.json { render json: @prodotto, status: :created, location: @prodotto }
      else
        format.html { render action: "new" }
        format.json { render json: @prodotto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /prodotti/1
  # PUT /prodotti/1.json
  def update
    @prodotto = Prodotto.find(params[:id])

    respond_to do |format|
      if @prodotto.update_attributes(params[:prodotto])
        format.html { redirect_to @prodotto, notice: 'Prodotto aggiornato con successo.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @prodotto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prodotti/1
  # DELETE /prodotti/1.json
  def destroy
    @prodotto = Prodotto.find(params[:id])
    @prodotto.destroy

    respond_to do |format|
      format.html { redirect_to prodotti_url }
      format.json { head :no_content }
    end
  end
end
