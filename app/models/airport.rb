class Airport < ActiveRecord::Base
  attr_accessible :external_id, :ident, :external_type, :name, :latitude_deg,
    :longitude_deg, :elevation_ft, :continent, :iso_country, :iso_region, :municipality,
    :scheduled_service, :gps_code, :iata_code, :local_code, :home_link, :wikipedia_link,
    :keywords
  
  serialize :keywords
end
