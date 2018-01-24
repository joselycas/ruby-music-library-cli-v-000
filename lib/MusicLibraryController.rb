require 'pry'
class MusicLibraryController
attr_accessor :path
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    user_input = ""
    while user_input != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      user_input = gets.chomp
      case user_input
        when "list songs'"
            puts "Welcome to your music library!"
        when "list artists"
            puts "To list all of your artists, enter 'artists'."
        when "list genres"
            puts "To list all of your genres, enter 'genres'."
        when "list artist"
            puts "To list all of your artist, enter 'artist'."
        when "list genre"
            puts "To list all of your genre, enter 'list genre'."
        end
      end
  end

  def list_songs
    Song.all.sort{ |x,y| x.name <=> y.name }.each.with_index(1) do |s, index|
        puts "#{index}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort{ |x,y| x.name <=> y.name }.each.with_index(1) do |s, index|
        puts "#{index}. #{s.name}"
    end
  end

  def list_genres
    Genre.all.sort{ |x,y| x.name <=> y.name }.each.with_index(1) do |s, index|
        puts "#{index}. #{s.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.strip
    artist = Artist.find_by_name(user_input)
    if artist
      artist.songs.sort{ |x,y| x.name <=> y.name }.each.with_index(1) do |s, index|
        puts "#{index}. #{s.name} - #{s.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.strip
    genre = Genre.find_by_name(user_input)
    if genre
      genre.songs.sort{ |x,y| x.name <=> y.name }.each.with_index(1) do |s, index|
        puts "#{index}. #{s.artist.name} - #{s.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    user_input = gets.strip
    if user_input == list_songs
      user_input
    end
  end
end