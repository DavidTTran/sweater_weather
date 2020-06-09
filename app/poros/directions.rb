class Directions
  attr_reader :start_location,
              :start_coords,
              :end_location,
              :end_coords,
              :travel_time,
              :time_unix

  def initialize(direction_info)
    @start_location = get_start_location(direction_info)
    @start_coords = get_start_coords(direction_info)
    @end_location = get_end_location(direction_info)
    @end_coords = get_end_coords(direction_info)
    @travel_time = get_travel_time(direction_info)
    @time_unix = get_time_unix(direction_info)
  end

  def get_start_location(direction_info)
    direction_info[:routes][0][:legs][0][:start_address]
  end

  def get_start_coords(direction_info)
    direction_info[:routes][0][:legs][0][:start_location]
  end

  def get_end_location(direction_info)
    direction_info[:routes][0][:legs][0][:end_address]
  end

  def get_end_coords(direction_info)
    direction_info[:routes][0][:legs][0][:end_location]
  end

  def get_travel_time(direction_info)
    direction_info[:routes][0][:legs][0][:duration][:text]
  end

  def get_time_unix(direction_info)
    direction_info[:routes][0][:legs][0][:duration][:value]
  end
end
