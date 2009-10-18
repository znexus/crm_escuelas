class PlantillasController < ApplicationController
  # GET /plantillas
  # GET /plantillas.xml
  def index
    @plantillas = Plantilla.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @plantillas }
    end
  end

  # GET /plantillas/1
  # GET /plantillas/1.xml
  def show
    @plantilla = Plantilla.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @plantilla }
    end
  end

  # GET /plantillas/new
  # GET /plantillas/new.xml
  def new
    @plantilla = Plantilla.new

    respond_to do |format|
      format.html { render :action => "edit" }# new.html.erb
      format.xml  { render :xml => @plantilla }
    end
  end

  # GET /plantillas/1/edit
  def edit
    @plantilla = Plantilla.find(params[:id])
  end

  # POST /plantillas
  # POST /plantillas.xml
  def create
    @plantilla = Plantilla.new(params[:plantilla])

    respond_to do |format|
      if @plantilla.save
        flash[:notice] = 'Plantilla was successfully created.'
        format.html { redirect_to(@plantilla) }
        format.xml  { render :xml => @plantilla, :status => :created, :location => @plantilla }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @plantilla.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /plantillas/1
  # PUT /plantillas/1.xml
  def update
    @plantilla = Plantilla.find(params[:id])

    respond_to do |format|
      if @plantilla.update_attributes(params[:plantilla])
        flash[:notice] = 'Plantilla was successfully updated.'
        format.html { redirect_to(@plantilla) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @plantilla.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /plantillas/1
  # DELETE /plantillas/1.xml
  def destroy
    @plantilla = Plantilla.find(params[:id])
    @plantilla.destroy

    respond_to do |format|
      format.html { redirect_to(plantillas_url) }
      format.xml  { head :ok }
    end
  end
end
