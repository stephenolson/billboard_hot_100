class BillboardHot100::Song

  attr_accessor :rank, :title, :artist, :last_week, :peak_position, :weeks_on_chart, :lyrics, :award

  @@all = []

  def initialize(song_hash)
    song_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.create(songs)
    songs.each do |song|
      self.new(song)
    end
  end

  def self.all
    @@all
  end

end
