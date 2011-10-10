class PlayersController < ApplicationController
  def index
    @player = Player.new
    @players = Player.order("checked DESC, updated_at ASC")
  end

  def show
    @player = Player.find(params[:id])
  end
  
  def new
    @player = Player.new
  end
  
  def create
    @player = Player.new(params[:player])
    if @player.save
      redirect_to :index, :notice => "You have successfully signed up."
    else
      render :action => 'index'
    end
  end
  
  def checkin
    @player = Player.where('name = ? OR email = ?', params[:name], params[:name]).first
    
    unless @player
      flash[:alert] = "Player with given name isn't registered for the current tournament. Please contact our staff at channel 'SCV Rush' 30 minutes before the tournament starts."
    end
    
    if @player.checked?
      flash[:alert] = "You are already checked in."
    else
      @player.checked = true
      @player.save!
      flash[:notice] = "You have successfully checked in."
    end

    redirect_to :action => 'index'
  end
end
