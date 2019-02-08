class SessionsController < ApplicationController
include SessionsHelper

    def create
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        flash[:success] = "Connecté"
        redirect_to "/gossips"
      else
        flash[:danger] = "Email et/ou mot de passe invalide"
        render :new

      end
    end

    def destroy
      if session.delete(:user_id)
        flash[:danger] = "deconnexion"
        redirect_to "/gossips"
      else
        flash[:succes] = "Connecté"
        redirect_to "/gossips"
      end
    end
end
