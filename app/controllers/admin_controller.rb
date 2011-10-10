class AdminController < ApplicationController
  http_basic_authenticate_with :name => "admin", :password => "welikemanners24#"
  
  def index
    @players = Player.all
    @emails = @players.map { |player| "#{player.email} #{player.name}"}.join("\n")
  end
  
  def update
    @players = params[:emails]
    # only users from the form will be kept
    Player.destroy_all
    invalid = []
    # create players from all the emails submitted
    @players.lines.each do |line|
      email, name = line.gsub(/\s+/, " ").split(/\s/).map(&:chomp)
      player = Player.create(:email => email, :name => name)
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
