class OrganismsController < ApplicationController
  def index
    @organisms = Organism.all
    @search = params["search"]
      if @search.present?
        @nomSC = @search["nomSC"]
        @organisms = Organism.where("nomSC ILIKE ?", "%#{@nomSC}%")
      end
  end
end
