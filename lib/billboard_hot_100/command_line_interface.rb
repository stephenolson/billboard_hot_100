class BillboardHot100::CommandLineInteface

  def run
    BillboardHot100::Scraper.scrape_songs
    # BillboardHot100::Song.create(songs)    
    welcome
  end

  def welcome 
    puts "\nWelcome to the this weeks Billboard Hot 100!\n"
    ranges
  end

  def ranges
    puts "\nPlease enter the rankings you wish to see...\n\n"

    total = BillboardHot100::Song.all.size
    increment = 10
    ranges = total/increment
    ranking = 1
    ranges_s = ""
  
    ranges.times do
      ranges_s << "#{ranking}-#{ranking+increment-1}, "
      ranking += increment
    end
    puts ranges_s[0...-2]
  
    quantize_input(increment, total)
  end

  def quantize_input(increment, total)    
    input = gets.strip
    case  
      when input.to_i.between?(1,total)
        low_num = ((input.to_i-1)/increment).floor*increment
        display_songs(increment, input, low_num)
      when input.downcase == "exit"
        exit 
      else
        invalid_choice
        ranges
    end
  end

  def display_songs(increment, input, low_num) 
    puts  "\nDisplaying songs #{low_num+1} through #{low_num+increment}\n\n"
    BillboardHot100::Song.all[low_num,increment].each do |song|
      puts "#{song.rank}. #{song.title} by #{song.artist}"
    end
    
    more_info(increment, input, low_num)
  end
  
  def more_info(increment, input, low_num)
    puts "\nPlease enter the song you want more information on, or type LIST to select a new range of songs.\n"
    input = gets.strip
    
    case
      when input.to_i.between?(low_num+1,low_num+increment)
        song = BillboardHot100::Song.all[input.to_i-1]
        display_song(song)
      when input.downcase == "list"
        ranges
      when input.downcase == "exit"
        exit
      else
        puts "\nPlease enter a number between #{low_num+1} and #{low_num+increment}, or type LIST to select a new range of songs.\n".colorize(:red)
        display_songs(increment, input, low_num)
    end
    continue
  end

  def continue
    puts "\nWould you like information on another song? Enter Y or N\n"

    input = gets.strip.downcase
    case input
      when "y"
        ranges
      when "n", "exit"
        exit
      else
        invalid_choice
        continue
    end
  end

  def display_song(song)
    puts "\n#{song.rank}. #{song.title} by #{song.artist}"
    
    if song.last_week.length > 0 && !song.last_week.include?("-")
      puts "Last Week: #{song.last_week}"
    else
      puts "New To Chart!".colorize(:blue)
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
      puts "Award: #{song.award}".colorize(:blue)
    end
  end

  def invalid_choice
    puts "\nInvalid Choice, Please Try Again!".colorize(:red)
  end
  
  def exit
    puts "\nCheck back next week for the latest Billboard Hot 100!"
    exit!
  end

end