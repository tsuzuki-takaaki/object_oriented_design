# find abstraciton between concreat bicycles
# and use inheritance

class Bicycle
end

class RoadBicycle
  attr_reader :style, :size, :tape_color, :front_shock, :rear_shock

  def initialize(args)
    @style = args[:style]
    @size = args[:size]
    @tape_color = args[:tape_color]
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
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

mountain_bicycle = MountainBicycle.new(size: 'S', front_shock: 'Manitou', rear_shock: 'Fox')
puts mountain_bicycle.style
puts mountain_bicycle.size
puts mountain_bicycle.spares
