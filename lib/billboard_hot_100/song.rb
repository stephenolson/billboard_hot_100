class BillboardHot100::Song

  attr_accessor :rank, :title, :artist, :last_week, :peak_position, :weeks_on_chart, :lyrics, :award

  @@all = []

  def initialize(songs4)
    songs4.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.create(songs5)
    songs5.each do |songs6|
      self.new(songs6)
    end
  end

  def self.all
    @@all
  end

  def self.find(index)
    self.all[index-1]
  end

end
