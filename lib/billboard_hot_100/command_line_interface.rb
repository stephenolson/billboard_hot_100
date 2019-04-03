class BillboardHot100::CommandLineInteface

  def run
    BillboardHot100::Scraper.scrape_songs
    welcome
    list_ranges
    more_info
    goodbye
  end

  def welcome 
    puts "\nWelcome to the this weeks Billboard Hot 100!\n"
  end

  def list_ranges
    puts "\nPlease enter the rankings you wish to see...\n"
    puts "\nEnter 1-10, 11-20, 21-30, 31-40, 41-50, 51-60, 61-70, 71-80, 81-90 or 91-100\n"
    input = gets.strip.to_i
    display_songs(input)
  end

  def display_songs(input)
    case input
      when 1..100
        increment = 10
        quantize(input, increment)
      else
        invalid_choice
    end
  end

  def quantize(input, increment)
    low_num = ((input-1)/increment).floor*increment
    display_ten_songs(low_num)
  end

  def display_ten_songs(low_num)
    puts "\nDisplaying songs #{low_num+1} through #{low_num+10}\n\n"
    BillboardHot100::Song.all[low_num,10].each do |song|
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
        run
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
    run
  end

end
