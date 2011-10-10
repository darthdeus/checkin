class Player < ActiveRecord::Base
  attr_accessible :name, :email, :checked
  
  validates :email, :presence => :true
end
