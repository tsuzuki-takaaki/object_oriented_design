# Adding Mountain bike
# -> Bicycle have both Load Bicycle and Mountain Bicycle

class Bicycle
  # :front_shock and :rear_shock are for only Mountain Bicycle
  attr_reader :style, :size, :tape_color, :front_shock, :rear_shock

  # argsはdefaultでHahsクラス
  # args: {:size=>"M", :tape_color=>"red"}
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

bike = Bicycle.new(style: :moutain, size: 'S', front_shock: 'Manitou', rear_shock: 'Fox')
puts bike.spares
