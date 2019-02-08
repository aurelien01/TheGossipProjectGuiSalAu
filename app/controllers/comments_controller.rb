class CommentsController < ApplicationController
  def index
  end

  def new
    @current_comment = Comment.new
  end

  def show
    @current_comment = Comment.find((params[:id]))
  end

  def edit
  end

  def create
    @current_comment = Comment.new(content: params[:content], user_id: User.last.id, gossip_id: params[:gossip_id] )
    @current_comment.user = current_user
    if @current_comment.save
      flash[:success] = "YES we did it !!"
      redirect_to "/gossips/"
    else
      flash[:danger] = "tu pue"
      redirect_to "/gossips"
    end
  end

  def destroy
    @current_comment= Comment.find(params[:id])
    if @current_comment.destroy
      flash[:success] = "YES we did it !!"
      redirect_to "/gossips/"
    else
      flash[:danger] = "tu pue"
      redirect_to "/gossips"
    end
  end
end
