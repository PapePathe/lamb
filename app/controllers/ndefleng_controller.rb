class NdeflengController < ApplicationController
  
  
  def index
    
    # => Les prochians combats à l'affiche sur ndefleng
    @combats_officiels = Combat.incoming.featured.includes([:challenger, :champion, :fightable]).order(:occurs_at).limit(10)
       
    # => Les derniers verdicts
    @recent_combats =  Combat.recent.limit(20)
    
  end
  
end
