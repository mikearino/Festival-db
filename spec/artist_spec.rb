require 'spec_helper'


describe('#Artist') do
  describe('.all') do
    it("returns an empty array when there are no artists") do
      expect(Artist.all).to(eq([]))
    end
  end
  describe('#save') do
    it("saves an artist") do
      artist1 = Artist.new({:name => "The Beatles", :stage_number => 1, :time => "3:00"})
      artist1.save()
      artist2 = Artist.new({:name => "Black Sabbath", :stage_number => 1, :time => "1:00"})
      artist2.save()
      artist3 = Artist.new({:name => "Sublime", :stage_number => 2, :time => "4:00"})
      artist3.save()
      artist4 = Artist.new({:name => "Greatful Dead", :stage_number =>2,  :time =>"1:00"})
      artist4.save()
      expect(Artist.all).to(eq([artist1, artist2, artist3, artist4]))
    end
  end

  describe('.find_by_stage') do
    it('finds all artists on a given stage number') do
      stage1 = Stage.new(:number => 1)
      stage2 = Stage.new(:number => 2)
      artist1 = Artist.new(:name => "The Beatles", :stage_number => 1, :time => "3:00")
      artist1.save()
      artist2 = Artist.new(:name => "Black Sabbath", :stage_number => 1, :time => "1:00")
      artist2.save()
      artist3 = Artist.new(:name => "Sublime", :stage_number => 2, :time => "4:00")
      artist3.save()
      artist4 = Artist.new(:name => "Greatful Dead", :stage_number =>2,  :time =>"1:00")
      artist4.save()
      expect(stage1.artists).to(eq([@artist1, @artist2]))
      expect(stage2.artists).to(eq([@artist3, @artist4]))
    end
  end
  # describe('.find_by_time') do
  #   it('finds all artists performing at a given time') do
  #     expect(Artist.find_by_time("1:00")).to(eq([@artist2, @artist4]))
  #   end
  # end
end
