class GossipsController < ApplicationController
  def index
  end

  def show
    @current_gossip = Gossip.find(params[:id])
  #  @current_comment = @current_gossip.comments.new
  end

  def new
    @gossip = Gossip.new
  end

  def edit
    @gossip = Gossip.find(params[:id])

  end

  def create
    @gossip = Gossip.create(title: params[:title], content: params[:content], user_id: User.last.id)
    @gossip.user = current_user
      if @gossip.save
        flash[:success] = "YES we did it !!"
        redirect_to "/gossips"
      else
        flash[:danger] = "Erreur, titre et/ou contenu manquant(s)"
        redirect_to "/gossips/new"
      end
  end

  def update
    @gossip = Gossip.find(params[:id])
      if @gossip.update(title: params[:title], content: params[:content])
        flash[:success] = "YES we did it !!"
        redirect_to "/gossips"
      else
        flash[:danger] = "Tu n'as rien modifier"
        redirect_to "/gossips/:id/edit"
      end

  end

  def destroy
    @gossip = Gossip.find(params[:id])
      if @gossip.destroy
        flash[:success] = "YES we did it !!"
        redirect_to "/gossips"
      else
        flash[:danger] = "Ton potin n'as pas été supprimer"
        redirect_to "/gossips/:id/edit"
      end
    end
end
