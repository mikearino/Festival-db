class Stage
  attr_reader(:number)
  def initialize(number)
    @number = number
  end

  def artists
    Artist.find_by_stage(number)
  end    
end
