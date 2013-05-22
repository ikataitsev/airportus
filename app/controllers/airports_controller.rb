class AirportsController < ApplicationController
  respond_to :html, :json

  def index
    @airports = Airport.russian.large
    logger.debug "Airports Loaded: #{@airports.size}"
    respond_with @airports
  end
end
