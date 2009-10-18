class ComentariosController < ApplicationController
  layout false
  # http://revolutiononrails.blogspot.com/2007/05/drying-up-polymorphic-controllers.html
  parent_resources :plantillas

  # GET /adjuntos
  def index
    @adjuntos = Adjunto.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @adjuntos }
    end
  end

  # POST /comentarios
  # POST /comentarios.xml
  def create

    @objeto = parent_object
    @adjunto = @objeto.adjuntos.build(params[:adjunto])
    
    respond_to do |format|
      if @adjunto.save
        flash[:notice] = 'Adjunto was successfully created.'
        format.html { redirect_to(adjuntos_url) }
        format.xml  { render :xml => @adjunto, :status => :created, :location => @adjunto }
      else
        format.html 
        format.xml  { render :xml => @comentario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comentarios/1
  # DELETE /comentarios/1.xml
  def destroy
    @adjunto = Adjunto.find(params[:id])
    @adjunto.destroy

    respond_to do |format|
      format.html { redirect_to(adjuntos_url) }
      format.xml  { head :ok }
    end
  end
end
