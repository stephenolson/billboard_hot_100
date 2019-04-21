class BillboardHot100::Scraper
  def self.scrape_songs
    songs2 = []
    index = Nokogiri::HTML(open("https://www.billboard.com/charts/hot-100"))
      index.css("div.chart-list-item").each do |song3|
        songs2 << {
          :rank => song3.css(".chart-list-item__rank").text.strip,
          :title => song3.css(".chart-list-item__title-text").text.strip,
          :artist => song3.css(".chart-list-item__artist").text.strip,
          :last_week => song3.css(".chart-list-item__last-week").text.strip,
          :peak_position => song3.css(".chart-list-item__weeks-at-one").text.strip,
          :weeks_on_chart => song3.css(".chart-list-item__weeks-on-chart").text.strip,
          :lyrics => song3.css('div.chart-list-item__lyrics a').map { |link| link['href'] }.join,
          :award => song3.css(".chart-list-item__award-icon").text.strip
        }
      end
    songs2
  end
end