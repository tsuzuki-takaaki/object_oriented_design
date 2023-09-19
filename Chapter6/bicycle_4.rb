# Move abstract logic to Bicycle
# Public interface

class Bicycle
  attr_reader :size

  def initialize(args={})
    @size = args[:size]
  end
end

class RoadBicycle < Bicycle
  attr_reader :tape_color

  def initialize(args)
    @tape_color = args[:tape_color]
    super(args)
  end

  def spares
    if style == :road
      {
        chain: '10-speed',
        tire_size: '23',
        tape_color: tape_color,
      }
    else
      {
        chain: '10-speed',
        tire_size: '2.1',
        rear_shock: rear_shock,
      }
    end
  end

  # ...other methods
end

class MountainBicycle < Bicycle
  attr_reader :front_shock, :rear_shock

  def initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
    super(args)
  end

  def spares
    super.merge(rear_shock: rear_shock)
  end
end

bicy = Bicycle.new(size: 'S')
road_bicycle = RoadBicycle.new(size: 'M')
puts road_bicycle.size