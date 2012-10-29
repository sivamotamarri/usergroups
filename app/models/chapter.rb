class Chapter < ActiveRecord::Base
  acts_as_soft_deletable         
  stampable

  has_many :chapter_members
  has_many :messages
  accepts_nested_attributes_for :messages
  
  has_many :users , :through => :chapter_members
  has_many :events
  belongs_to :country
  belongs_to :state
  belongs_to :city
  belongs_to :user, :foreign_key => :created_by
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :chapter_type, :country_id , :state_id, :city_id , :locality, :address ,:landmark,:chapter_status, :country_name, :state_name, :city_name,:messages_attributes,:rejected_on , :approved_on

  #validations
  validates :name, :country_id , :state_id, :city_id,:country_name, :state_name, :city_name,:chapter_type, presence: true
  validates :locality, :address ,:landmark, presence: true , :if => lambda { |o| o.chapter_type == "student"}
  #Scopes
   scope :applied_chapters, where(:chapter_status => [:applied, :incubated,:denied])
   scope :incubated_chapters, where(:chapter_status => :incubated)
   scope :active_chapters, where(:chapter_status => :active)
   scope :delist_chapters, where(:chapter_status => :delist)

  state_machine :chapter_status, :initial => :applied do

    # The first transition that matches the status and passes its conditions
    event :deny do
        transition :applied => :denied
    end

    event :incubate do
        transition :applied => :incubated
    end

    event :active do
        transition :incubated => :active
    end

    event :delist do
        transition :incubated => :delist
    end

    event :active_to_incubate do
        transition :active => :incubated
    end

    event :delist_to_incubate do
        transition :delist => :incubated
    end

  end

  def location
    location = city_name
    location += "," + state_name if !state_name.blank?
    location += "," + country_name if !country_name.blank?
  end
  
end
