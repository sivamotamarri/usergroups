class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #using the user stamp gem to populate created by, last modified by
  model_stamper
  acts_as_soft_deletable         
  stampable
  has_one :eventbrite_oauth_token

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me , :first_name, :last_name , :fullname,:mobile, :website_url, :linkedin_url, :twitter_url
#  validates :first_name , :last_name , :presence => true
end
