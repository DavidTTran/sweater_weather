class Restaurant
  attr_reader :address, :name
  def initialize(info)
    @address = info[:restaurants][0][:restaurant][:location][:address]
    @name = info[:restaurants][0][:restaurant][:name]
  end
end
