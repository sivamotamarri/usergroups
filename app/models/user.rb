class User < ActiveRecord::Base
  model_stamper
  #using the user stamp gem to populate created by, last modified by
  attr_accessible :first_name, :last_name, :email
end
