require 'rspec'
require 'pry'
require 'artist'
require 'stage'

describe('#Artist') do
  before(:each) do
    @stage1 = Stage.new(1)
    @stage2 = Stage.new(2)

    Artist.clear
    @artist1 = Artist.new("Artist1", 1, "12:00")
    @artist1.save()
    @artist2 = Artist.new("Artist2", 1, "1:00")
    @artist2.save()
    @artist3 = Artist.new("Artist3", 2, "12:00")
    @artist3.save()
    @artist4 = Artist.new("Artist4", 2, "1:00")
    @artist4.save()

    # artist1 = Artist.add("Artist1", 1, "12:00")
    # artist2 = Artist.add("Artist2", 1, "1:00")
    # artist3 = Artist.add("Artist3", 2, "12:00")
    # artist4 = Artist.add("Artist4", 2, "1:00")
  end
  describe('.find_by_stage') do
    it('finds all artists on a given stage number') do
      expect(@stage1.artists).to(eq([@artist1, @artist2]))
      expect(@stage2.artists).to(eq([@artist3, @artist4]))
    end
  end
  describe('.find_by_time') do
    it('finds all artists performing at a given time') do
      expect(Artist.find_by_time("1:00")).to(eq([@artist2, @artist4]))
    end
  end
end
