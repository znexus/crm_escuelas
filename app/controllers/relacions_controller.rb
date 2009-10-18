class RelacionsController < ApplicationController
  layout false
  
  # GET /relacions
  # GET /relacions.xml
  def index
    @objeto = objeto
    @relacions = @objeto.relacions.find(:all) unless @objeto.blank?

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @relacions }
    end
  end

  # GET /relacions/1
  # GET /relacions/1.xml
  def show
    @relacion = Relacion.find(params[:id])

    respond_to do |format|
      format.js
      format.html { render :partial => "linea", :locals=>{:relacion=>@relacion} }# show.html.erb
      format.xml  { render :xml => @relacion }
    end
  end

  # GET /relacions/new
  # GET /relacions/new.xml
  def new
    @objeto = objeto
    @relacion = objeto.relacions.build
    respond_to do |format|
      format.html { render :action=> "edit" }# new.html.erb
      format.xml  { render :xml => @relacion }
    end
  end

  # GET /relacions/1/edit
  def edit
    @relacion = Relacion.find(params[:id])
  end

  # POST /relacions
  # POST /relacions.xml
  def create
    @relacion = Relacion.new(params[:relacion])

    respond_to do |format|
      if @relacion.save
        flash[:notice] = 'Relacion was successfully created.'
        format.js
        format.html { redirect_to(@relacion) }
        format.xml  { render :xml => @relacion, :status => :created, :location => @relacion }
      else
        format.js  { render :action => "update" }
        format.html { render :action => "edit" }
        format.xml  { render :xml => @relacion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /relacions/1
  # PUT /relacions/1.xml
  def update
    @relacion = Relacion.find(params[:id])

    respond_to do |format|
      if @relacion.update_attributes(params[:relacion])
        flash[:notice] = 'Relacion was successfully updated.'
        format.js { render :action=>"show" }
        format.html { redirect_to(@relacion) }
        format.xml  { head :ok }
      else
        format.js  { render :action => "update" }
        format.html { render :action => "edit" }
        format.xml  { render :xml => @relacion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /relacions/1
  # DELETE /relacions/1.xml
  def destroy
    @relacion = Relacion.find(params[:id])
    @id = @relacion.id
    @relacion.destroy

    respond_to do |format|
      format.js
      format.html { redirect_to(relacions_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  def objeto
    ob = nil
    ob = Persona.find(params[:persona_id]) unless params[:persona_id].blank?
    ob = Institucion.find(params[:institucion_id]) unless params[:institucion_id].blank?
    ob
  end
end
