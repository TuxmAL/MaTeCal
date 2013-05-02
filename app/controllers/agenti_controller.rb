class AgentiController < ApplicationController
  # GET /agenti
  # GET /agenti.json
  def index
    @agenti = Agente.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @agenti }
    end
  end

  # GET /agenti/1
  # GET /agenti/1.json
  def show
    @agente = Agente.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @agente }
    end
  end

  # GET /agenti/new
  # GET /agenti/new.json
  def new
    @agente = Agente.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @agente }
    end
  end

  # GET /agenti/1/edit
  def edit
    @agente = Agente.find(params[:id])
  end

  # POST /agenti
  # POST /agenti.json
  def create
    @agente = Agente.new(params[:agente])

    respond_to do |format|
      if @agente.save
        format.html { redirect_to @agente, notice: 'Agente creato con successo.' }
        format.json { render json: @agente, status: :created, location: @agente }
      else
        format.html { render action: "new" }
        format.json { render json: @agente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /agenti/1
  # PUT /agenti/1.json
  def update
    @agente = Agente.find(params[:id])

    respond_to do |format|
      if @agente.update_attributes(params[:agente])
        format.html { redirect_to @agente, notice: 'Agente modificato con successo.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @agente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agenti/1
  # DELETE /agenti/1.json
  def destroy
    @agente = Agente.find(params[:id])
    @agente.destroy

    respond_to do |format|
      format.html { redirect_to agenti_url }
      format.json { head :no_content }
    end
  end
end
