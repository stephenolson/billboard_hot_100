class BillboardHot100::Scraper

  def self.scrape_songs
    doc = Nokogiri::HTML(open("https://www.billboard.com/charts/hot-100"))
    doc.css("div.chart-list-item").each do |song|
      BillboardHot100::Song.new(
      rank = song.css(".chart-list-item__rank").text.strip,
      title = song.css(".chart-list-item__title-text").text.strip,
      artist = song.css(".chart-list-item__artist").text.strip,
      last_week = song.css(".chart-list-item__last-week").text.strip,
      peak_position = song.css(".chart-list-item__weeks-at-one").text.strip,
      weeks_on_chart = song.css(".chart-list-item__weeks-on-chart").text.strip,
      lyrics = song.css('div.chart-list-item__lyrics a').map { |link| link['href'] }.join,
      award = song.css('chart-list-item__award-icon').text.strip)
    end
  end

end