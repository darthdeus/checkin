class Player < ActiveRecord::Base
  attr_accessible :name, :email
  
  validates :email, :presence => :true
end
