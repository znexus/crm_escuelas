
Gem.clear_paths
#
require "inline_attachment"
#require 'action_mailer/ar_mailer'
require 'htmlentities'
#class Postoffice < ActionMailer::ARMailer
class Postoffice < ActionMailer::Base
  UPLOADED = "/uploads"
  UPLOADED_ROOT = RAILS_ROOT + "/public" + UPLOADED
  MIME_TYPES = [
    "image/jpg",
    "image/jpeg",
    "image/pjpeg",
    "image/gif",
    "image/png",
    "application/x-shockwave-flash"
  ]

  def lista(objeto, plantilla, user)

    titulo = nil
    titulo = objeto.titulo if objeto.titulo_id
    variables =  {
      "nombre" => objeto.nombre,
      "apepat" => objeto.apepat,
      "apemat" => objeto.apemat,
      "titulo" => titulo
    }
    
    #texto del envío
    texto = plantilla.texto
    #reemplazo los valores
    template = Liquid::Template.parse(texto)
    texto = template.render variables
    
    #busco las imágenes y defino los reemplazos
    images = []
    texto.scan(/"\/uploads\/Image\/([0-9A-Za-z_.]*)"/) { |s| images << s[0] }
    texto.gsub!(/"\/uploads\/Image\/([0-9A-Za-z_.]*)"/, '"cid:CID_\1'+'@escuelasunidas.com"' )
    
    #modo texto   
    coder = HTMLEntities.new

    #quitar los Javascript y Estilos modo texto
    texto_plano = coder.decode( texto.gsub(/<style>.*<\/style>/mi,"\n"))
    #texto_plano = texto
    
    #preparo el email:    
    recipients   objeto.email
    from         user.email
    subject      plantilla.nombre
    sent_on      Time.now
    content_type    "multipart/alternative"

    part "text/plain" do |p|
      p.body = render_message("lista.text.plain.erb", :texto => texto_plano)
      p.content_disposition = ""
      p.transfer_encoding = "7bit"
      #p.charset = "ISO-8859-15"
    end

    part "multipart/related" do |p|
      p.parts << ActionMailer::Part.new(
        :content_type => "text/html", 
        :body => render_message("lista.text.html.erb", :part_container => p, :texto => texto),
        :disposition => "",
        :transfer_encoding => "7bit"
        #:charset => "ISO-8859-15",
      )
      images.uniq!

      images.each do |image|    
        p.inline_attachment :content_type => "image/png", 
                            :body => File.read(UPLOADED_ROOT + "/Image/" + image),
                            :filename => '"' + image + '"',
                            :name => '"' + image + '"',
                            :cid => "<CID_#{image}@escuelasunidas.com>"       
      end
      
    end

  end  

end
