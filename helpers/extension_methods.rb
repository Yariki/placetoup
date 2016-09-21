module Helpers
  require 'json'
  require 'google_places/spot'



  def photo_to_json(p)
    {
        width: p.width,
        height: p.height,
        photo_referense: p.photo_reference,
        url: p.fetch_url(p.width)
    }.to_json
  end

  def spot_to_json(s)
    photos = nil
    if(s.photos != nil)
      photos = Array.new(s.photos.length)
      s.photos.each_index { |i| photos[i] = photo_to_json(s.photos[i]) }
    end

    {
        lat: s.lat,
        lng: s.lng,
        name: s.name,
        id: s.id,
        types: s.types,
        icon: s.icon,
        websits: s.website,
        photos: photos,
    }.to_json
  end


end