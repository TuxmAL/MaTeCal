class ZoneController < ApplicationController
  # GET /zone
  # GET /zone.json
  def index
    @zone = Zona.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @zone }
    end
  end

  # GET /zone/1
  # GET /zone/1.json
  def show
    @zona = Zona.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @zona }
    end
  end

  # GET /zone/new
  # GET /zone/new.json
  def new
    @zona = Zona.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @zona }
    end
  end

  # GET /zone/1/edit
  def edit
    @zona = Zona.find(params[:id])
  end

  # POST /zone
  # POST /zone.json
  def create
    @zona = Zona.new(params[:zona])

    respond_to do |format|
      if @zona.save
        format.html { redirect_to @zona, notice: 'Zona creata con successo.' }
        format.json { render json: @zona, status: :created, location: @zona }
      else
        format.html { render action: "new" }
        format.json { render json: @zona.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /zone/1
  # PUT /zone/1.json
  def update
    @zona = Zona.find(params[:id])

    respond_to do |format|
      if @zona.update_attributes(params[:zona])
        format.html { redirect_to @zona, notice: 'Zona aggiornata con successo.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @zona.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /zone/1
  # DELETE /zone/1.json
  def destroy
    @zona = Zona.find(params[:id])
    @zona.destroy

    respond_to do |format|
      format.html { redirect_to zone_url }
      format.json { head :no_content }
    end
  end
end
