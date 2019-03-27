class BillboardHot100::Song

  attr_accessor :rank, :name, :artist, :last_week, :peak_position, :weeks_on_chart, :award, :lyrics

  @@all = []

  def self.songs(song)
    self.new(
      song.css(".chart-list-item__rank").text.strip,
      song.css(".chart-list-item__title-text").text.strip,
      song.css(".chart-list-item__artist").text.strip,
      song.css(".chart-list-item__last-week").text.strip,
      song.css(".chart-list-item__weeks-at-one").text.strip,
      song.css(".chart-list-item__weeks-on-chart").text.strip,
      song.css("[class='chart-list-item__award-icon ']").text.strip,
      song.css('div.chart-list-item__lyrics a').map { |link| link['href'] }
      )
  end

  # billboard.com changed their code, making a separate "number_1" unecessary
  # def self.number_1(song)
  #   self.new(
  #     rank = "1",
  #     song.css(".chart-number-one__title").text.strip,
  #     song.css(".chart-number-one__artist").text.strip,
  #     song.css(".chart-number-one__last-week").text.strip,
  #     peak_position = "1",
  #     song.css(".chart-number-one__weeks-on-chart").text.strip
  #     )
  # end

  def initialize(rank=nil, name=nil, artist=nil, last_week=nil, peak_position=nil, weeks_on_chart=nil, award=nil, lyrics=nil)
    
    @rank = rank
    @name = name
    @artist = artist
    @last_week = last_week
    @peak_position = peak_position
    @weeks_on_chart = weeks_on_chart
    @award = award
    @lyrics = lyrics
    
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(index)
    self.all[index-1]
  end
  
end