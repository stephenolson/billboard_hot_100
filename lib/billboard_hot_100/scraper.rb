class BillboardHot100::Scraper

  def get_page
    Nokogiri::HTML(open("https://www.billboard.com/charts/hot-100"))
  end

  def scrape_songs
    self.get_page.css("div.chart-list-item")
  end

  def make_songs
    scrape_songs.each do |song|
      BillboardHot100::Song.songs(song)
    end
  end

  def scrape_dates
    self.get_page.css("div.chart-detail-header__select-date")
  end

  def make_dates
    scrape_dates.each do |date|
      BillboardHot100::Date.dates(date)
    end
  end

  # billboard.com changed their code, making a separate "number_1" unecessary
  # def scrape_number_1
  #   self.get_page.css("div.chart-number-one__info")
  # end

  # def make_number_1
  #  scrape_number_1.each do |song|
  #    BillboardHot100::Song.number_1(song)
  #  end
  # end

end