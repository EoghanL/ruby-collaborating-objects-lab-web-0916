require 'pry'

class MP3Importer

  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = []
    Dir.entries(@path).map { |file| @files << file if file.length > 3 }
  end

  def import
    files.each do |file_name|
      artist = Artist.find_or_create_by_name(file_name.split(" - ").first)
      artist.songs << Song.new(file_name.split(" - ")[1])
    end
  end

end
