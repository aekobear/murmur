class PolitreesController < ApplicationController
  
  def index
    @politrees = Politree.all
  end

end
