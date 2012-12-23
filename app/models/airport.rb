class Airport < ActiveRecord::Base
  include_root_in_json = false

  attr_accessible :external_id, :ident, :external_type, :name, :latitude_deg,
    :longitude_deg, :elevation_ft, :continent, :iso_country, :iso_region, :municipality,
    :scheduled_service, :gps_code, :iata_code, :local_code, :home_link, :wikipedia_link,
    :keywords

  serialize :keywords

  scope :with_municipality, where('municipality is not null')
  scope :open, with_municipality.where("external_type != ?", 'closed')
  scope :iata, open.where('iata_code IS NOT NULL')

  scope :small,  iata.where(external_type: 'small_airport')
  scope :medium, iata.where(external_type: 'medium_airport')
  scope :large,  iata.where(external_type: 'large_airport')

  scope :russian, iata.where(iso_country: 'RU')

  def coordinates
    [self.latitude_deg, self.longitude_deg]
  end

  def latitude_deg
    read_attribute(:latitude_deg).to_f.round(4)
  end

  def longitude_deg
    read_attribute(:longitude_deg).to_f.round(4)
  end

  def type
    self.external_type.to_f
  end

  def to_json
    super(:only => [:name, :latitude_deg, :longitude_deg, :municipality], :methods => [:kupibilet_url])
  end

  def kupibilet_url
    "http://www.kupibilet.ru/#SY100#{Time.now.tomorrow.strftime("%d%^b")}LED#{self.iata_code}"
  end

  def image_url
    "http://f.cl.ly/items/373z1x1i230f0O3I2L21/default_airport.gif"
  end
end
