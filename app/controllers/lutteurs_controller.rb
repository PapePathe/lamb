class LutteursController < ApplicationController
	
	def index
	  
		@vips = Lutteur.vips		
		
		@featured = Lutteur.page(params[:page]).not_vips.featured
		
		
	end
	
	def show
		@lutteur = Lutteur.find(params[:id])
	end
	
	
	
end
