class AirportsController < ApplicationController
  respond_to :html, :json

  def index
    @airports = Airport.russian.large.medium
    logger.debug "Airports Loaded: #{@airports.size}"
    respond_with @airports
  end
end
