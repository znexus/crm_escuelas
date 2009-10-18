class Lista < ActiveRecord::Base
  belongs_to  :listable,
                :polymorphic => true
  
  belongs_to  :user
  
end
