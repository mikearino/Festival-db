class Artist
  @@artists = []
  attr_accessor(:name, :stage_number, :time)
  def initialize(name, stage_number, time)
    @name = name
    @stage_number = stage_number
    @time = time
  end

  def save
    @@artists.push(self)
  end

  def self.find_by_stage(number)
    @@artists.select { |artist| artist.stage_number == number }
  end

  def
end
