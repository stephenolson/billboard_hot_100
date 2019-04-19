# class BillboardHot100::Song

#   attr_accessor :rank, :title, :artist, :last_week, :peak_position, :weeks_on_chart, :lyrics, :award

#   @@all = []

#   def initialize(rank=nil, title=nil, artist=nil, last_week=nil, peak_position=nil, weeks_on_chart=nil, lyrics=nil, award=nil)
#     @rank = rank
#     @title = title
#     @artist = artist
#     @last_week = last_week
#     @peak_position = peak_position
#     @weeks_on_chart = weeks_on_chart
#     @lyrics = lyrics
#     @award = award

#     @@all << self
#   end

#   def self.all
#     @@all
#   end

# end

class BillboardHot100::Song

  attr_accessor :rank, :title, :artist, :last_week, :peak_position, :weeks_on_chart, :lyrics, :award

  @@all = []

  def initialize(song_hash)
    song_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.create(songs_complete)
    songs_complete.each do |song_hash|
      self.new(song_hash)
    end
  end

  def self.all
    @@all
  end

  def self.find(index)
    self.all[index-1]
  end

end
