# encoding: utf-8
class CampagneController < ApplicationController
  # GET /campagne
  # GET /campagne.json
  def index
    @campagne = Campagna.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @campagne }
    end
  end

  # GET /campagne/1
  # GET /campagne/1.json
  def show
    @campagna = Campagna.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @campagna }
    end
  end

  # GET /campagne/new
  # GET /campagne/new.json
  def new
    @campagna = Campagna.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @campagna }
    end
  end

  # GET /campagne/1/edit
  def edit
    @campagna = Campagna.find(params[:id])
  end

  # POST /campagne
  # POST /campagne.json
  def create
    @campagna = Campagna.new(params[:campagna])

    respond_to do |format|
      if @campagna.save
        format.html { redirect_to @campagna, notice: 'Campagna creata con successo.' }
        format.json { render json: @campagna, status: :created, location: @campagna }
      else
        format.html { render action: "new" }
        format.json { render json: @campagna.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /campagne/1
  # PUT /campagne/1.json
  def update
    @campagna = Campagna.find(params[:id])

    respond_to do |format|
      if @campagna.update_attributes(params[:campagna])
        format.html { redirect_to @campagna, notice: 'Campagna aggiornata con successo.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @campagna.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campagne/1
  # DELETE /campagne/1.json
  def destroy
    @campagna = Campagna.find(params[:id])
    @campagna.destroy

    respond_to do |format|
      format.html { redirect_to campagne_url }
      format.json { head :no_content }
    end
  end
end
