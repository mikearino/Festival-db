class Artist

  attr_accessor(:name, :stage_number, :time)
  def initialize(attributes)
    @name = attributes.fetch(:name)
    @stage_number = attributes.fetch(:stage_number)
    @time = attributes.fetch(:time)
  end


  def self.all
  returned_artists = DB.exec("SELECT * FROM artists;")
  artists = []
  returned_artists.each() do |artist|
    name = artist.fetch("name")
    stage_number = artist.fetch("stage_number").to_i
    time = artist.fetch("time")
    artists.push(Artist.new({:name => name, :stage_number => stage_number, :time => time}))
  end
  artists
end

def save
  result = DB.exec("INSERT INTO artists (name, stage_number, time) VALUES ('#{@name}', '#{@stage_number}', '#{@time}');")
end
  def self.find_by_stage(stage_number)
    artist = DB.exec("SELECT * FROM artists WHERE stage_number = #{stage_number};").first
    if artist
      name = artist.fetch("name")
      stage_number = artist.fetch("stage_number").to_i
      time = artist.fetch("time")
      Artist.new({:name => name, :stage_number => stage_number, :time => time})
    else
      nil
  end
  end

  # def self.find_by_time(time)
  #   @@artists.select { |artist| artist.time == time }
  # end
  #
  # def self.find_by_name(name)
  #   @@artists.select { |artist| artist.name.downcase.include? (name.downcase) }
  # end
  #
  #
  # def self.all
  #   @@artists
  # end
  # def self.clear
  #   @@artists = []
  # end
  # def self.add(name, stage_number, time)
  #   @@artists.push(Artist.new(name, stage_number, time))
  # end
  # def self.find(name)
  #   found_artist = nil
  #   @@artists.each do |artist|
  #     if artist.name == name
  #       found_artist = artist
  #       break
  #     end
  #   end
  #   found_artist
  # end
  def ==(other_artist)
    (@name == other_artist.name) & (@stage_number == other_artist.stage_number) & (@time == other_artist.time)
  end
  # def update(name, stage_number, time)
  #   @name = name
  #   @stage_number = stage_number
  #   @time = time
  # end
  # def delete
  #   @@artists.delete(self)
  # end
end
