class AdminController < ApplicationController
  http_basic_authenticate_with :name => "admin", :password => "admin"
  
  def index
    @players = Player.all
    @emails = @players.map(&:email).join("\n")
  end
  
  def update
    @emails = params[:emails]
    # only users from the form will be kept
    Player.destroy_all
    invalid = []
    # create players from all the emails submitted
    @emails.split(/\s/).each do |email|
      player = Player.create(:email => email.chomp)
      invalid << email unless player.valid?
    end
    flash[:notice] = "Players saved."
    redirect_to :action => :index
  end

  def toggle
    @player = Player.find(params[:id])
    @player.checked = !@player.checked
    @player.save
    flash[:notice] = "Player status updated."
    redirect_to :action => :index
  end

end
