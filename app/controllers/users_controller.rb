class UsersController < ApplicationController
  def index
  end

  def show
    @current_user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password], age: params[:age], city_id: params[:city], description: params[:description])
    if @user.save
      flash[:success] = "Félicitation, tu as créer ton compte"
      redirect_to "/gossips"
    else
      flash[:danger] = "Sérieux?? Comment tu fais pour ne pas reussir a remplir les champs !"
      render :new
    end
  end

  def edit
  end
end
