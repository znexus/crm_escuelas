class InstitucionsController < ApplicationController

  def index
    @search = session[:busca_institucion] unless session[:busca_institucion].blank?
    @institucions = buscar(@search)
  end

  
  def show
    @institucion = Institucion.find(params[:id])
    session[:institucion] = [] unless session[:institucion]
    session[:institucion].unshift(@institucion.id) unless session[:institucion].include?(@institucion.id)
    if session[:institucion].size > 2
      session[:institucion].pop
    end
  end


  def new
    @institucion = Institucion.new
    render :template => "institucions/edit"
  end


  def edit
    @institucion = Institucion.find(params[:id])
  end


  def create
    @institucion = Institucion.new(params[:institucion])
    if @institucion.save
      flash[:notice] = 'Institucion was successfully created.'
      redirect_to(@institucion)
    else
      render :action => "new", :template => "institucions/edit"
    end
  end


  def update
    @institucion = Institucion.find(params[:id])
    if @institucion.update_attributes(params[:institucion])
      flash[:notice] = 'Institucion was successfully updated.'
      redirect_to(@institucion)
    else
      render :action => "edit"
    end
  end


  def destroy
    @institucion = Institucion.find(params[:id])
    @institucion.destroy
    redirect_to(institucions_url)
  end
  
  #buscando
  def search
    @institucions = nil
    @institucions = buscar(params[:search]) unless params[:search].blank?
    @institucions = buscar(session[:busca_institucion]) unless session[:busca_institucion].blank?
    render :partial=>'search' , :layout=>false
  end
  
  def relacion_search
    @institucions = nil
    @institucions = buscar(params[:relacion_institucion]) unless params[:relacion_institucion].blank?
    render :layout=>false    
  end

   #busca institucions
  def buscar(nombre)
    unless nombre.blank?
      session[:busca_institucion] = nombre
      #separo el nombre por palabras y espacios
      nombre = nombre.split.map { |n| n } unless nombre
      #formo la cadena de búsqueda
      consulta = nombre.map{ |c| "(nombre like '%#{c}%' OR ruc like '%#{c}%') "}     
      Institucion.find(:all, :conditions => consulta.join(' OR '), :limit=>30)
    end
  end

#  def index
#    @institucions = Institucion.find(:all)
#  end
#  
#  def show
#    @institucion = Institucion.find(params[:id])
#  end

#  def new
#    @institucion = Institucion.new
#    render :template => "institucions/edit"
#  end

#  def edit
#    @institucion = Institucion.find(params[:id])
#  end

#  def create
#    @institucion = Institucion.new(params[:institucion])
#    if @institucion.save
#      flash[:notice] = 'Institucion was successfully created.'
#      redirect_to(@institucion)
#    else
#      render :action => "new", :template => "institucions/edit"
#    end
#  end

#  def update
#    @institucion = Institucion.find(params[:id])
#    if @institucion.update_attributes(params[:institucion])
#      flash[:notice] = 'Institucion was successfully updated.'
#      redirect_to(@institucion)
#    else
#      render :action => "edit"
#    end
#  end

#  def destroy
#    @institucion = Institucion.find(params[:id])
#    @institucion.destroy
#    redirect_to(institucions_url)
#  end 
end
