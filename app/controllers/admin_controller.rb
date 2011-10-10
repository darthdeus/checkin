class AdminController < ApplicationController
  http_basic_authenticate_with :name => "admin", :password => "welikemanners24#"
  
  def index
    @players = Player.all
    @emails = @players.map(&:email).join("\n")
  end
  
  def update
    @users = params[:emails]
    # only users from the form will be kept
    Player.destroy_all
    invalid = []
    # create players from all the emails submitted
    @users.lines.each do |line|
      email, name = line.gsub(/\s+/, " ").split(/\s/)
      player = Player.create(:email => email.chomp, :name => name.chomp)
      invalid << player unless player.valid?
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
