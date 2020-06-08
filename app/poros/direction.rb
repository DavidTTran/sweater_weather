class Direction
  def initialize(direction_info)
    @directions = direction_info
  end

  def start_location
    require "pry"; binding.pry
    @directions[:routes][0][:legs][0][:start_address]
  end

  def start_coords
    @directions[:routes][0][:legs][0][:start_location]
  end

  def end_location
    @directions[:routes][0][:legs][0][:end_address]
  end

  def end_coords
    @directions[:routes][0][:legs][0][:end_location]
  end

  def travel_time
    @directions[:routes][0][:legs][0][:duration][:text]
  end
end
