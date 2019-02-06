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
      if @gossip.save
        flash[:success] = "Woohoo!"

        redirect_to "/gossips"
      else
        flash[:alert] = "Alerting you to the monkey on your car!"
        redirect_to "/gossips/new"
      end
  end
end
