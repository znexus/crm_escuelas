class EmpresasController < ApplicationController
   
  def index
    @search = session[:busca_empresa] unless session[:busca_empresa].blank?
    @empresas = buscar(@search)
  end

  
  def show
    @empresa = Empresa.find(params[:id])
  end


  def new
    @empresa = Empresa.new
    render :template => "empresas/edit"
  end


  def edit
    @empresa = Empresa.find(params[:id])
  end


  def create
    @empresa = Empresa.new(params[:empresa])
    if @empresa.save
      flash[:notice] = 'Empresa was successfully created.'
      redirect_to(@empresa)
    else
      render :action => "new", :template => "empresas/edit"
    end
  end


  def update
    @empresa = Empresa.find(params[:id])
    if @empresa.update_attributes(params[:empresa])
      flash[:notice] = 'Empresa was successfully updated.'
      redirect_to(@empresa)
    else
      render :action => "edit"
    end
  end


  def destroy
    @empresa = Empresa.find(params[:id])
    @empresa.destroy
    redirect_to(empresas_url)
  end
  
  #buscando
  def search
    @empresas = nil
    @empresas = buscar(params[:search]) unless params[:search].blank?
    @empresas = buscar(session[:busca_empresa]) unless session[:busca_empresa].blank?
    render :partial=>'search' , :layout=>false
  end
  
  def relacion_search
    @empresas = nil
    @empresas = buscar(params[:relacion_empresa]) unless params[:relacion_empresa].blank?
    render :layout=>false    
  end

   #busca empresas
  def buscar(nombre)
    unless nombre.blank?
      session[:busca_empresa] = nombre
      #separo el nombre por palabras y espacios
      nombre = nombre.split.map { |n| n } unless nombre
      #formo la cadena de búsqueda
      consulta = nombre.map{ |c| "nombre like '%#{c}%' OR ruc like '%#{c}%' "}     
      Empresa.find(:all, :conditions => consulta.join(' OR '), :limit=>20)
    end
  end
  
end
