class Adjunto < ActiveRecord::Base
  belongs_to :adjuntable,
             :polymorphic => true

  has_attachment :content_type => :image,
                 :storage      => :file_system,
                 :max_size     => 2.megabytes,
                 :resize_to => '800>' ,
                 :thumbnails   => {
                   :large => '400>' ,
                   :medium => '200>' ,
                   :small => '100>'
                 }
                 
  validates_as_attachment

end
