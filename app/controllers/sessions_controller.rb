class SessionsController < ApplicationController

  def new
    
  end
  
  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      redirect_back_or_to root_url, :notice => "vous etes mantenant connecte"
    else
      flash.now.alert = "Email ou mot de passe invalide"
      render :new
    end    
  end
  
  def destroy
    logout
    redirect_to root_url, :notice => "vous etes maintenant deconnecte"    
  end
  
end