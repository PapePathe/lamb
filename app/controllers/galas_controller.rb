class GalasController < ApplicationController

  # TODO add more formats json, sitemap


  def index
    @incoming = Gala.featured.incoming.includes([:combats => [:challenger, :champion]]).limit(10)
  end

  def show
    @gala = Gala.find params[:id]
  end

end
