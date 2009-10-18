class TipoVinculosController < ApplicationController
  # GET /tipo_vinculos
  # GET /tipo_vinculos.xml
  def index
    @tipo_vinculos = TipoVinculo.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tipo_vinculos }
    end
  end

  # GET /tipo_vinculos/1
  # GET /tipo_vinculos/1.xml
  def show
    @tipo_vinculo = TipoVinculo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tipo_vinculo }
    end
  end

  # GET /tipo_vinculos/new
  # GET /tipo_vinculos/new.xml
  def new
    @tipo_vinculo = TipoVinculo.new

    respond_to do |format|
      format.html { render :action => "edit" }# new.html.erb
      format.xml  { render :xml => @tipo_vinculo }
    end
  end

  # GET /tipo_vinculos/1/edit
  def edit
    @tipo_vinculo = TipoVinculo.find(params[:id])
  end

  # POST /tipo_vinculos
  # POST /tipo_vinculos.xml
  def create
    @tipo_vinculo = TipoVinculo.new(params[:tipo_vinculo])

    respond_to do |format|
      if @tipo_vinculo.save
        flash[:notice] = 'TipoVinculo was successfully created.'
        format.html { redirect_to(@tipo_vinculo) }
        format.xml  { render :xml => @tipo_vinculo, :status => :created, :location => @tipo_vinculo }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tipo_vinculo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tipo_vinculos/1
  # PUT /tipo_vinculos/1.xml
  def update
    @tipo_vinculo = TipoVinculo.find(params[:id])

    respond_to do |format|
      if @tipo_vinculo.update_attributes(params[:tipo_vinculo])
        flash[:notice] = 'TipoVinculo was successfully updated.'
        format.html { redirect_to(@tipo_vinculo) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tipo_vinculo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_vinculos/1
  # DELETE /tipo_vinculos/1.xml
  def destroy
    @tipo_vinculo = TipoVinculo.find(params[:id])
    @tipo_vinculo.destroy

    respond_to do |format|
      format.html { redirect_to(tipo_vinculos_url) }
      format.xml  { head :ok }
    end
  end
end
