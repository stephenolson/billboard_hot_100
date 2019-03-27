class BillboardHot100::Song

  attr_accessor :rank, :name, :artist, :last_week, :peak_position, :weeks_on_chart

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
