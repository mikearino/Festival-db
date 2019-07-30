class Stage
  attr_accessor(:number)
  def initialize(attributes)
    @number = attributes.fetch(:number)
  end

  def artists
    Artist.find_by_stage(@number)
  end
end
