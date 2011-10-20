class AdminController < ApplicationController
  http_basic_authenticate_with :name => "admin", :password => "welikemanners24#"
  
  def index
    @players = Player.order("checked DESC, updated_at ASC")
    @emails = @players.map { |player| "#{player.email}|#{player.name}"}.join("\n")
    
    @invalid = session[:invalid] || []
    session[:invalid] = nil
  end

  def create
    @player = Player.from_data(params[:player_data])
    
    if @player.save
      flash[:notice] = "Player successfuly added."
    else
      flash[:error] = "Unable to save player, most likely due to wrong format."
    end
  end
  
  def update
    @players = params[:emails]
    # only users from the form will be kept
    Player.destroy_all
    invalid = []
    # create players from all the emails submitted
    @players.lines.each do |line|
      match = line.match(/(.+)\|(\w+\.\d+)/)
      if match
        email = match[1]
        name = match[2]      
        player = Player.create(:email => email, :name => name)
      else
        invalid << line
      end
    end
    flash[:notice] = "Players saved."
    session[:invalid] = invalid
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
