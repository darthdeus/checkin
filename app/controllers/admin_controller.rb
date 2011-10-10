class AdminController < ApplicationController
  before_filter :authenticate

  
  def index
    @players = Player.all
    @emails = @players.map(&:email).join("\n")
  end
  
  def update
    @emails = params[:emails]
    Player.destroy_all
    invalid = []
    @emails.split("\n").each do |email|
      player = Player.create(:email => email)
      invalid << email unless player.valid?
    end
    redirect_to :action => :index
  end

  protected
  
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "admin" && password == "admin"
    end
  end
end
