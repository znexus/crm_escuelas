class ListasController < ApplicationController

  # http://revolutiononrails.blogspot.com/2007/05/drying-up-polymorphic-controllers.html
  parent_resources :persona, :institucion, :familia
  # GET /listas
  # GET /listas.xml
  def index
    @listas = current_user.listas.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @listas }
    end
  end

  # GET /listas/1
  # GET /listas/1.xml
  def show
    @lista = Lista.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lista }
    end
  end

  # GET /listas/new
  # GET /listas/new.xml
  def new
    @lista = Lista.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lista }
    end
  end

  # GET /listas/1/edit
  def edit
    @lista = Lista.find(params[:id])
  end

  # POST /listas
  # POST /listas.xml
  def create

    @objeto = parent_object
    @lista = @objeto.listas.build
    @lista.user = current_user
    
    respond_to do |format|
      if @lista.save
        flash[:notice] = 'Lista was successfully created.'
        format.js { render :partial=>"listar", :locals=>{:objeto=>@objeto} }
        format.html { redirect_to(@lista) }
        format.xml  { render :xml => @lista, :status => :created, :location => @lista }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @lista.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /listas/1
  # PUT /listas/1.xml
  # realmente este método me borra la relación
  def update
    @lista = Lista.find(params[:id])
    @objeto = parent_object
    @lista.destroy
    
    respond_to do |format|
      format.js { render :partial=>"listar", :locals=>{:objeto=>@objeto} }
      format.html { redirect_to(listas_url) }
      format.xml  { head :ok }
    end
  end

  # DELETE /listas/1
  # DELETE /listas/1.xml
  def destroy
    @lista = Lista.find(params[:id])
    @lista.destroy

    respond_to do |format|
      format.html { redirect_to(listas_url) }
      format.xml  { head :ok }
    end
  end
  
  #para eliminar todos
  def delete_all
    current_user.listas.delete_all
    respond_to do |format|
      format.html { redirect_to(listas_url) }
      format.xml  { head :ok }
    end
  end
end
