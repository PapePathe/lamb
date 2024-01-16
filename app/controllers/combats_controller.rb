class CombatsController < ApplicationController

  def watch

    @combat = Combat.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end

  end


end
