class BillboardHot100::Scraper

  def self.scrape_billboard
    songs = []
    index = Nokogiri::HTML(open("https://www.billboard.com/charts/hot-100"))
    index.css("div.chart-list-item").each do |song|
      song_info = {}
      song_info[:rank] = song.css(".chart-list-item__rank").text.strip
      song_info[:name] = song.css(".chart-list-item__title-text").text.strip
      song_info[:artist] = song.css(".chart-list-item__artist").text.strip
      song_info[:last_week] = song.css(".chart-list-item__last-week").text.strip
      song_info[:peak_position] = song.css(".chart-list-item__weeks-at-one").text.strip
      song_info[:weeks_on_chart] = song.css(".chart-list-item__weeks-on-chart").text.strip
      # song_info[:lyrics] = song.search("a.chart-list-item__lyrics").first.attr("href").strip
      
      songs << song_info
    end
    songs
  end
  
  def self.scrape_number_1
    number_1 = []
    index = Nokogiri::HTML(open("https://www.billboard.com/charts/hot-100"))
    index.css("div.chart-number-one__info").each do |song|
      song_info = {}
      song_info[:rank] = "1"
      song_info[:name] = song.css(".chart-number-one__title").text.strip
      song_info[:artist] = song.css(".chart-number-one__artist").text.strip
      song_info[:last_week] = song.css(".chart-number-one__last-week").text.strip
      song_info[:peak_position] = "1"
      song_info[:weeks_on_chart] = song.css(".chart-number-one__weeks-on-chart").text.strip
      number_1 << song_info
    end
    number_1
  end

  def make_songs
    number_1 = BillboardHot100::Scraper.scrape_number_1
    songs = BillboardHot100::Scraper.scrape_billboard
    songs_complete = number_1 + songs
    # new_song = BillboardHot100::Song.new(song)
    BillboardHot100::Song.create(songs_complete)
  end

end
