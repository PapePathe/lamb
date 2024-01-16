class EcuriesController < ApplicationController

  def index
    
    @ecuries = Ecury.all
    
  end
  
  
  def show
    
    @ecury = Ecury.find(params[:id])
    
    
    @lutteurs = @ecury.lutteurs
    
  end

end