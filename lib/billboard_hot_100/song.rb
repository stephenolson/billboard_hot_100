class BillboardHot100::Song

  attr_accessor :rank, :title, :artist, :last_week, :peak_position, :weeks_on_chart, :lyrics, :award

  @@all = []

  def initialize(rank=nil, title=nil, artist=nil, last_week=nil, peak_position=nil, weeks_on_chart=nil, lyrics=nil, award=nil)
    @rank = rank
    @title = title
    @artist = artist
    @last_week = last_week
    @peak_position = peak_position
    @weeks_on_chart = weeks_on_chart
    @lyrics = lyrics
    @award = award

    @@all << self
  end

  def self.all
    @@all
  end

end