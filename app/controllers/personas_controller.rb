class PersonasController < ApplicationController
  # GET /personas
  def index
    @search = session[:busca_persona] unless session[:busca_persona].blank?
    @personas = buscar(@search)
  end

  # GET /personas/1
  def show
    @persona = Persona.find(params[:id])
    #guardo la persona en la sesión para que esté por ahí
    session[:persona] = [] unless session[:persona]
    session[:persona].unshift(@persona.id) unless session[:persona].include?(@persona.id)
    if session[:persona].size > 2
      session[:persona].pop
    end
  end

  # GET /personas/new
  def new
    @persona = Persona.new
    @titulos = Titulo.find(:all, :order => "nombre")
    render :template => "personas/edit"
  end

  # GET /personas/1/edit
  def edit
    @persona = Persona.find(params[:id])
    @titulos = Titulo.find(:all, :order => "nombre")
  end

  # POST /personas
  def create
    @persona = Persona.new(params[:persona])
    if @persona.save
      flash[:notice] = 'Persona was successfully created.'
      redirect_to(@persona)
    else
      @titulos = Titulo.find(:all, :order => "nombre")
      render :action => "new", :template => "personas/edit"
    end
  end

  # PUT /personas/1
  def update
    @persona = Persona.find(params[:id])
    if @persona.update_attributes(params[:persona])
      flash[:notice] = 'Persona was successfully updated.'
      redirect_to(@persona)
    else
      @titulos = Titulo.find(:all, :order => "nombre")
      render :action => "edit"
    end
  end

  # DELETE /personas/1
  def destroy
    @persona = Persona.find(params[:id])
    @persona.destroy
    redirect_to(personas_url)
  end 

  #buscando
  def search
    @personas = nil
    @personas = buscar(params[:search]) unless params[:search].blank?
    @personas = buscar(session[:busca_persona]) unless session[:busca_persona].blank?
    render :partial=>'search' , :layout=>false
  end
  
  #busca para relaciones, y para crear familias
  def relacion_search
    @personas = nil
    @personas = buscar(params[:relacion_persona]) unless params[:relacion_persona].blank?
    @personas = buscar(params[:familia_padre]) unless params[:familia_padre].blank?
    @personas = buscar(params[:familia_madre]) unless params[:familia_madre].blank?
    render :layout=>false
  end
  
   #busca personas
  def buscar(nombre)
    unless nombre.blank?
      session[:busca_persona] = nombre
      #separo el nombre por palabras y espacios
      nombre = nombre.split
      #formo la cadena de búsqueda
      consulta = nombre.map{ |c| "(nombre like '%#{c}%' OR apepat like '%#{c}%' OR apemat like '%#{c}%')"}     
      Persona.find(:all, :conditions => consulta.join(' AND '), :limit=>30)
    end
  end
   
end
