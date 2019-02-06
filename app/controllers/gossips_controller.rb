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
    @gossip = Gossip.find(params[:id])

  end

  def create
    @gossip = Gossip.create(title: params[:title], content: params[:content], user_id: User.all.sample.id)
      if @gossip.save
        redirect_to "/gossips"
      else
        redirect_to "/gossips/new"
      end
  end

  def update
    @gossip = Gossip.find(params[:id])
      if @gossip.update(title: params[:title], content: params[:content])
        redirect_to "/gossips"
      else
        redirect_to "/gossips/:id/edit"
      end

  end

  def destroy
    @gossip = Gossip.find(params[:id])
      if @gossip.destroy
        redirect_to "/gossips"
      else
        redirect_to "/gossips/:id/edit"
      end
    end
end
