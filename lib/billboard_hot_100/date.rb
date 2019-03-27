class BillboardHot100::Date
    attr_accessor :week
  
    @@all = []
  
    def self.dates(date)
      self.new(
        date.css("[class='chart-detail-header__date-selector-button']").text.strip
      )
    end
  
    def initialize(week=nil)
      @week = week
      @@all << self
    end
      
    def self.all
      @@all
    end
  
  end