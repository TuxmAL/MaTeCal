# encoding: utf-8
class ModPagsController < ApplicationController
  # GET /mod_pags
  # GET /mod_pags.json
  def index
    @mod_pags = ModPag.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mod_pags }
    end
  end

  # GET /mod_pags/1
  # GET /mod_pags/1.json
  def show
    @mod_pag = ModPag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mod_pag }
    end
  end

  # GET /mod_pags/new
  # GET /mod_pags/new.json
  def new
    @mod_pag = ModPag.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mod_pag }
    end
  end

  # GET /mod_pags/1/edit
  def edit
    @mod_pag = ModPag.find(params[:id])
  end

  # POST /mod_pags
  # POST /mod_pags.json
  def create
    @mod_pag = ModPag.new(params[:mod_pag])

    respond_to do |format|
      if @mod_pag.save
        format.html { redirect_to @mod_pag, notice: 'Modalità di pagamento creata con successo.' }
        format.json { render json: @mod_pag, status: :created, location: @mod_pag }
      else
        format.html { render action: "new" }
        format.json { render json: @mod_pag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mod_pags/1
  # PUT /mod_pags/1.json
  def update
    @mod_pag = ModPag.find(params[:id])

    respond_to do |format|
      if @mod_pag.update_attributes(params[:mod_pag])
        format.html { redirect_to @mod_pag, notice: 'Modalità di pagamento aggiornata con successo.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mod_pag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mod_pags/1
  # DELETE /mod_pags/1.json
  def destroy
    @mod_pag = ModPag.find(params[:id])
    @mod_pag.destroy

    respond_to do |format|
      format.html { redirect_to mod_pags_url }
      format.json { head :no_content }
    end
  end
end
