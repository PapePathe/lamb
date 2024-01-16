class PromoteursController < ApplicationController
  def index
    @promoteurs = Promoteur.all
  end

  def show
    @promoteur = Promoteur.find(params[:id])
  end
end
