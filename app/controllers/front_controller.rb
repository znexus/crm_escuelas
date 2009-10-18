class FrontController < ApplicationController

  def index
    @actividades = Audit.find(:all, :limit => 20, :order => "id desc", 
                              :conditions => "auditable_type <>'Tag' " )
    @tags = Tag.counts
  end

  #procesa el envío de la lista por email
  def envios
    plantilla = Plantilla.find(params[:plantilla_id])
    lista = current_user.listas
    
    lista.each do |l|
      unless l.listable.email.blank?
        Postoffice.deliver_lista(l.listable, plantilla, current_user)
        l.enviado = true
        l.save
      end
    end

    render :layout=>false
  end
  
  def todas_familias
    @familias = Familia.paginate :page => params[:page], 
                :order => "personas.apepat, madres_familias.apepat",
                :include => [:padre, :madre]
    @cuenta = Familia.count(:all)
    
  end
  
  #obtiene la lista total de personas
  def todas_personas
    down = "/public/reportes/"
    reportes = RAILS_ROOT + down
    tiempo = Time.zone.now.to_s(:number)
    @personas = Persona.find :all, 
              :select=>"id, nombre, apepat, apemat, familia_id, sexo, nacimiento",
              :include=>["familia", "relacions"]
    #creo la hoja en excell
    book = Spreadsheet::Workbook.new
    sh1 = book.create_worksheet :name => "Personas"
    #relleno la hoja
    sh1.row(0).concat( ["Ficha persona","nombre","apepat","apemat","sexo","nacimiento","Ficha familia"] +
    ["p apepat","p nombre","m apepat","m nombre"] + 
    ["telefonos","direccion1","distrito","ciudad", "region","pais"] + 
    ["Ficha inst","institucion"]
    )
    #rellenando las filas con los datos
    i = 0
    @personas.each do |p|
      i=i+1
      #guardo el link a la ficha de la persona
      sh1.row(i).push Spreadsheet::Link.new(url_for(p),p.id.to_s)
      sh1.row(i).push p.nombre, p.apepat, p.apemat, p.sexo, p.nacimiento
      #la familia
      #guardo el link a la familia
      if p.familia_id? 
        sh1.row(i).push Spreadsheet::Link.new(url_for(p.familia),p.familia_id.to_s)
      else
        sh1.row(i).push "-sin familia-"
      end
      padre = nil
      madre = nil
      padre = p.familia.padre if p.familia_id and p.familia
      padre ||= Persona.new(:nombre=>"-sin padre-")
      madre = p.familia.madre if p.familia_id and p.familia
      madre ||= Persona.new(:nombre=>"-sin madre-")
      sh1.row(i).push(padre.apepat, padre.nombre)
      sh1.row(i).push(madre.apepat, madre.nombre)
      #direccion
      d = p.direccion
      sh1.row(i).push d.telefonos,d.street_1,d.street_2,d.city,d.region_name,d.country_with_region_check
      #institucion
      ins = p.institucions.first 
      unless ins == nil
        sh1.row(i).push Spreadsheet::Link.new(url_for(ins),ins.id.to_s), ins
      else
        sh1.row(i).push "", "-sin institución-"
      end

    end
    #guardo
    book.write reportes + "#{tiempo}.xls"
    @download =  "/reportes/#{tiempo}.xls"

  end
  
  #muestra los objetos guardados en este tag
  def tag
    @tag = params[:id]
    @personas = Persona.find_tagged_with(@tag,:order=>"apepat,apemat,nombre")
    @familias = Familia.find_tagged_with(@tag)       
    @instituciones = Institucion.find_tagged_with(@tag,:order=>"nombre")
    @comentarios = Comentario.find_tagged_with(@tag,:order=>"created_at desc")
  end

end
