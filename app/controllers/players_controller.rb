class PlayersController < ApplicationController
  def index
    @player = Player.new
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
  end
  
  def new
    @player = Player.new
  end
  
  def edit
    @emails = Player.all.map(&:email).join("\n")
  end
  

  def create
    @player = Player.new(params[:player])
    if @player.save
      redirect_to :index, :notice => "You have successfully signed up."
    else
      render :action => 'index'
    end
  end
end
