class UnitaController < ApplicationController
  # GET /unita
  # GET /unita.json
  def index
    @unita = Unita.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @unita }
    end
  end

  # GET /unita/1
  # GET /unita/1.json
  def show
    @unita = Unita.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @unita }
    end
  end

  # GET /unita/new
  # GET /unita/new.json
  def new
    @unita = Unita.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @unita }
    end
  end

  # GET /unita/1/edit
  def edit
    @unita = Unita.find(params[:id])
  end

  # POST /unita
  # POST /unita.json
  def create
    @unita = Unita.new(params[:unita])

    respond_to do |format|
      if @unita.save
        format.html { redirect_to @unita, notice: 'Unità creata con successo.' }
        format.json { render json: @unita, status: :created, location: @unita }
      else
        format.html { render action: "new" }
        format.json { render json: @unita.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /unita/1
  # PUT /unita/1.json
  def update
    @unita = Unita.find(params[:id])

    respond_to do |format|
      if @unita.update_attributes(params[:unita])
        format.html { redirect_to @unita, notice: 'Unità aggiornata con successo.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @unita.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unita/1
  # DELETE /unita/1.json
  def destroy
    @unita = Unita.find(params[:id])
    @unita.destroy

    respond_to do |format|
      format.html { redirect_to unita_index_url }
      format.json { head :no_content }
    end
  end
end
