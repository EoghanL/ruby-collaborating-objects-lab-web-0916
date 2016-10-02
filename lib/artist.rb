class Artist

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def add_song(song)
    @songs << song
  end

  def print_songs
    songs.each { |song| puts song.name }
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(artist_name)

    if !(@@all.any? { |artists| artists.name == artist_name })
      self.new(artist_name)
    else
      @@all.find { |artist| artist.name == artist_name }
    end

  end

end
