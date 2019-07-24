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

  def self.find_by_time(time)
    @@artists.select { |artist| artist.time == time }
  end

  def self.find_by_name(name)
    @@artists.select { |artist| artist.name.downcase.include? (name.downcase) }
  end


  def self.all
    @@artists
  end
  def self.clear
    @@artists = []
  end
  def self.add(name, stage_number, time)
    @@artists.push(Artist.new(name, stage_number, time))
  end
  def self.find(name)
    found_artist = nil
    @@artists.each do |artist|
      if artist.name == name
        found_artist = artist
        break
      end
    end
    found_artist
  end
  def ==(other_artist)
    (@name == other_artist.name) & (@stage_number == other_artist.stage_number) & (@time == other_artist.time)
  end
end
