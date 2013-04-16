# encoding: utf-8
class ModelliController < ApplicationController
  # GET /modelli
  # GET /modelli.json
  def index
    @modelli = Modello.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @modelli }
    end
  end

  # GET /modelli/1
  # GET /modelli/1.json
  def show
    @modello = Modello.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @modello }
    end
  end

  # GET /modelli/new
  # GET /modelli/new.json
  def new
    @modello = Modello.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @modello }
    end
  end

  # GET /modelli/1/edit
  def edit
    @modello = Modello.find(params[:id])
  end

  # POST /modelli
  # POST /modelli.json
  def create
    @modello = Modello.new(params[:modello])

    respond_to do |format|
      if @modello.save
        format.html { redirect_to @modello, notice: 'Modello creato con successo.' }
        format.json { render json: @modello, status: :created, location: @modello }
      else
        format.html { render action: "new" }
        format.json { render json: @modello.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /modelli/1
  # PUT /modelli/1.json
  def update
    @modello = Modello.find(params[:id])

    respond_to do |format|
      if @modello.update_attributes(params[:modello])
        format.html { redirect_to @modello, notice: 'Modello aggiornato con successo.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @modello.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /modelli/1
  # DELETE /modelli/1.json
  def destroy
    @modello = Modello.find(params[:id])
    @modello.destroy

    respond_to do |format|
      format.html { redirect_to modelli_url }
      format.json { head :no_content }
    end
  end
end
