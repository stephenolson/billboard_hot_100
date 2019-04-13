class BillboardHot100::CommandLineInteface

  def run
    BillboardHot100::Scraper.scrape_songs
    main_menu
  end

  def main_menu
    welcome
    list_ranges
    more_info
    goodbye
  end

  def welcome 
    puts "\nWelcome to the this weeks Billboard Hot 100!\n"
  end

  def list_ranges
    total = BillboardHot100::Song.all.size
    increment = 10
    song_ranges = total/increment
    ranking = 1
    ranges = ""
    puts "\nPlease enter the rankings you wish to see...\n"
  
    song_ranges.times do
      ranges << "#{ranking}-#{ranking+increment-1}, "
      ranking += increment
    end

    puts ranges[0...-2]
  
    input = gets.strip.to_i
    display_songs(input, total, increment)
  
  end

  def display_songs(input, total, increment)    
    case input  
      when 1..total
        quantize(input, increment)
      else
        invalid_choice
    end
  end

  def quantize(input, increment)
    low_num = ((input-1)/increment).floor*increment
    display_ten_songs(low_num, increment)
  end

  def display_ten_songs(low_num, increment)
    puts "\nDisplaying songs #{low_num+1} through #{low_num+increment}\n\n"
    BillboardHot100::Song.all[low_num,increment].each do |song|
      puts "#{song.rank}. #{song.title} by #{song.artist}"
    end
  end
  
  def more_info
      puts "\nPlease enter the song you want more information on.\n"
      input = gets.strip
      
      song = BillboardHot100::Song.all[input.to_i-1]

      display_song(song)

      puts "\nWould you like information on another song? Enter Y or N\n"

      input = gets.strip.downcase
      if input == "y"
        main_menu
      elsif input == "n"
        goodbye
      else
        invalid_choice
      end
  end

  def display_song(song)
    puts "\n#{song.rank}. #{song.title} by #{song.artist}"
      if song.last_week.length > 0 && !song.last_week.include?("-")
        puts "Last Week: #{song.last_week}"
      else
        puts "New To Chart!".colorize(:red)
      end
      if song.peak_position.length > 0 
        puts "Peak Position: #{song.peak_position}"
      end
      if song.weeks_on_chart.length > 0 
        puts "Weeks On Chart: #{song.weeks_on_chart}"
      end
      if song.lyrics.length > 0
        puts "Lyrics: #{song.lyrics}"
      end
      if song.award.length > 0 
        puts "Award: #{song.award}".colorize(:red)
      end
  end

  def goodbye
    puts "\nCheck back next week for the latest Billboard Hot 100!"
    exit
  end

  def invalid_choice
    puts "\nInvalid Choice!"
    main_menu
  end

end