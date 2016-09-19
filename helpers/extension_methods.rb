module Helpers
  require 'json'
  require 'google_places/spot'

  def spot_to_json(s)
    {
      lat: s.lat,
      lng: s.lng,
      name: s.name,
      id: s.id,
      types: s.types,
      icon: s.icon,
      websits: s.website,
      photos: s.photos
    }.to_json
  end


end