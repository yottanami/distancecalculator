module Distancecalculator
  class Customer
    attr_reader :name, :user_id

    EARTH_RADIUS = 6371

    def initialize(data)
      @lon     = to_radian(data['longitude'])
      @lat     = to_radian(data['latitude'])
      @name    = data['name']
      @user_id = data['user_id']
    end

    def distance
      x = Math.sin(@lat) *
        Math.sin(office_lat) +
        Math.cos(@lat) *
        Math.cos(office_lat) *
        Math.cos(@lon - office_lon)

      Math.acos(x) * EARTH_RADIUS
    end

    def nearby?
      distance <= 100
    end

    private


    def to_radian(degree)
      degree.to_f * Math::PI / 180
    end

    def office_lat
      # Latitude of Intercom office in Radian
      0.9309271809073008
    end

    def office_lon
      # Longitude of Intercom office in Radian
      -0.10921684028351844
    end
  end
end
