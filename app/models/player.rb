class Player < ActiveRecord::Base
  attr_accessible :name, :email, :checked
  
  validates :email, :presence => :true
  
  def self.from_data(data)
    player = Player.new
    player.parse_data(data)
    player
  end
  
  def parse_data(data)
    match = data.match(/(.+)\|(\w+\.\d+)/)
    if match
      self.email = match[1]
      self.name = match[2]
    end
  end
  
  def checkin!
    self.checked = true
    self.save!
  end
end
