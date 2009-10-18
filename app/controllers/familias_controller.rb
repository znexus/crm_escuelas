class FamiliasController < ApplicationController
   
  def index
    @search = session[:busca_familia] unless session[:busca_familia].blank?
    @familias = buscar(@search)
  end

  
  def show
    @familia = Familia.find(params[:id])
    session[:familia] = [] unless session[:familia]
    session[:familia].unshift(@familia.id) unless session[:familia].include?(@familia.id)
    if session[:familia].size > 2
      session[:familia].pop
    end
  end


  def new
    @familia = Familia.new
    render :template => "familias/edit"
  end


  def edit
    @familia = Familia.find(params[:id])
  end


  def create
    @familia = Familia.new(params[:familia])
    if @familia.save
      flash[:notice] = 'Familia was successfully created.'
      redirect_to(@familia)
    else
      render :action => "new", :template => "familias/edit"
    end
  end


  def update
    @familia = Familia.find(params[:id])
    if @familia.update_attributes(params[:familia])
      flash[:notice] = 'Familia was successfully updated.'
      redirect_to(@familia)
    else
      render :action => "edit"
    end
  end


  def destroy
    @familia = Familia.find(params[:id])
    @familia.destroy
    redirect_to(familias_url)
  end
  
  #buscando
  def search
    @familias = nil
    @familias = buscar(params[:search]) unless params[:search].blank?
    @familias = buscar(session[:busca_familia]) unless session[:busca_familia].blank?
    render :partial=>'search' , :layout=>false
  end
  
  def relacion_search
    @familias = nil
    @familias = buscar(params[:relacion_familia]) unless params[:relacion_familia].blank?
    render :layout=>false    
  end

   #busca familias
  def buscar(nombre)
    unless nombre.blank?
      session[:busca_familia] = nombre
      #separo el nombre por palabras y espacios
      nombre = nombre.split
      #formo la cadena de búsqueda
      consulta = nombre.map{ |c| "personas.apepat like '%#{c}%' OR madres_familias.apepat like '%#{c}%' "}     
      Familia.find(:all, :conditions => consulta.join(' OR '), :limit=>30, :include=>[:padre,:madre])
    end
  end
  
end

#SELECT `familias`.`id` AS t0_r0, `familias`.`padre_id` AS t0_r1, `familias`.`madre_id` AS t0_r2, 
#`familias`.`created_at` AS t0_r3, `familias`.`updated_at` AS t0_r4, `personas`.`id` AS t1_r0,
# `personas`.`nombre` AS t1_r1, `personas`.`apepat` AS t1_r2, `personas`.`apemat` AS t1_r3, 
# `personas`.`familia_id` AS t1_r4, `personas`.`titulo_id` AS t1_r5, `personas`.`sexo` AS t1_r6, 
# `personas`.`nacimiento` AS t1_r7, `personas`.`email` AS t1_r8, `personas`.`created_at` AS t1_r9, 
# `personas`.`updated_at` AS t1_r10, `madres_familias`.`id` AS t2_r0, `madres_familias`.`nombre` AS t2_r1, 
# `madres_familias`.`apepat` AS t2_r2, `madres_familias`.`apemat` AS t2_r3, `madres_familias`.`familia_id` AS t2_r4, 
# `madres_familias`.`titulo_id` AS t2_r5, `madres_familias`.`sexo` AS t2_r6, `madres_familias`.`nacimiento` AS t2_r7, 
# `madres_familias`.`email` AS t2_r8, `madres_familias`.`created_at` AS t2_r9, `madres_familias`.`updated_at` AS t2_r10 
# FROM `familias`  LEFT OUTER JOIN `personas` ON `personas`.id = `familias`.padre_id  
# LEFT OUTER JOIN `personas` madres_familias ON `madres_familias`.id = `familias`.madre_id 
# WHERE (personas.apepat like '%c%' OR madres_institucions.apepat like '%c%' )  LIMIT 20
 
 
 
