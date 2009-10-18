class TitulosController < ApplicationController
  # GET /titulos
  # GET /titulos.xml
  def index
    @titulos = Titulo.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @titulos }
    end
  end

  # GET /titulos/1
  # GET /titulos/1.xml
  def show
    @titulo = Titulo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @titulo }
    end
  end

  # GET /titulos/new
  # GET /titulos/new.xml
  def new
    @titulo = Titulo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @titulo }
    end
  end

  # GET /titulos/1/edit
  def edit
    @titulo = Titulo.find(params[:id])
  end

  # POST /titulos
  # POST /titulos.xml
  def create
    @titulo = Titulo.new(params[:titulo])

    respond_to do |format|
      if @titulo.save
        flash[:notice] = 'Titulo was successfully created.'
        format.html { redirect_to(@titulo) }
        format.xml  { render :xml => @titulo, :status => :created, :location => @titulo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @titulo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /titulos/1
  # PUT /titulos/1.xml
  def update
    @titulo = Titulo.find(params[:id])

    respond_to do |format|
      if @titulo.update_attributes(params[:titulo])
        flash[:notice] = 'Titulo was successfully updated.'
        format.html { redirect_to(@titulo) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @titulo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /titulos/1
  # DELETE /titulos/1.xml
  def destroy
    @titulo = Titulo.find(params[:id])
    @titulo.destroy

    respond_to do |format|
      format.html { redirect_to(titulos_url) }
      format.xml  { head :ok }
    end
  end
end
