class GossipsController < ApplicationController
  def index
  end

  def show
    @current_gossip = Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.new
  end

  def edit
  end

  def create
    @gossip = Gossip.create(title: params[:title], content: params[:content], user_id: User.last.id)
    @gossip.save
      if @gossip.save
        redirect_to "/gossips"
      else
        redirect_to "/gossips/new"
      end
  end
end
