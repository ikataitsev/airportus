# Sample:
#   "id","ident","type","name","latitude_deg","longitude_deg","elevation_ft","continent","iso_country","iso_region","municipality","scheduled_service","gps_code","iata_code","local_code","home_link","wikipedia_link","keywords"
#   6461,"UHSS","medium_airport","Yuzhno-Sakhalinsk Airport",46.8886985778809,142.718002319336,59,"AS","RU","RU-SAK","Yuzhno-Sakhalinsk","yes","UHSS","UUS",,"http://www.airportus.ru/","http://en.wikipedia.org/wiki/Yuzhno-Sakhalinsk_Airport","Аэропорт Южно-Сахалинск, Khomutovo"

require 'csv'

class CreateAirports < ActiveRecord::Migration
  def change
    create_table :airports do |t|
      t.integer :external_id
      t.string :ident
      t.string :external_type
      t.string :name, limit: 1000
      t.decimal :latitude_deg,  :precision => 18, :scale => 15
      t.decimal :longitude_deg, :precision => 18, :scale => 15
      t.integer :elevation_ft
      t.string :continent
      t.string :iso_country
      t.string :iso_region
      t.string :municipality, limit: 1000
      t.string :scheduled_service, limit: 1000
      t.string :gps_code
      t.string :iata_code
      t.string :local_code
      t.string :home_link, limit: 1000
      t.string :wikipedia_link, limit: 1000
      t.text :keywords

      t.timestamps
    end

    add_index :airports, :external_id
    add_index :airports, :ident

    # Populate!
    puts 'Populating airports table. Hold on...'
    path_to_airports = Rails.root.join('lib', 'data', 'airports.csv')
    CSV.foreach(path_to_airports, headers: true) do |row|
      attrs = row.to_hash
      attrs['external_id'] = attrs['id']
      attrs.delete 'id'
      attrs['external_type'] = attrs['type']
      attrs.delete 'type'

      Airport.create! attrs
    end
  end
end