class BillboardHot100::Song

  attr_accessor :rank, :title, :artist, :last_week, :peak_position, :weeks_on_chart, :lyrics, :award

  @@all = []

  def self.create(songs)
    songs.each do |song|
      self.new(song)
    end
  end

  def initialize(song_hash)
    song_hash.each do |key, value| 
      self.send("#{key}=", value)
    end
    @@all << self
  end

  def self.all
    @@all
  end

end
