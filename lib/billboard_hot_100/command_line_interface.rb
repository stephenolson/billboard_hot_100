class BillboardHot100::CommandLineInteface

  def run
    BillboardHot100::Scraper.new.make_songs
    BillboardHot100::Scraper.new.make_dates

    # billboard.com changed their code, making a separate "number_1" unecessary
    # BillboardHot100::Scraper.new.make_number_1
    menu
    goodbye
  end
  
  def menu
    input = nil
    
      puts ""
      display_date()      
      puts ""
      puts "Please enter the ranking you wish to see..."
      puts ""
      puts "Enter 1-10, 11-20, 21-30, 31-40, 41-50, 51-60, 61-70, 71-80, 81-90 or 91-100"
      puts ""

      input = gets.strip.to_i
      puts ""

      display_songs(input)
      puts ""
      puts "Please enter the song you want more information on or return to enter a new ranking."
      puts ""
      input = gets.strip
      
      song = BillboardHot100::Song.find(input.to_i)

      display_song(song)

      puts ""
      puts "Would you like information on another song? Enter Y or N"
      puts ""

      input = gets.strip.downcase
      if input == "y"
        menu
      elsif input == "n"
        goodbye
      else
        puts ""
        puts "I don't understand that answer!"
        puts ""
        run
      end
  end

  def display_date()
    BillboardHot100::Date.all.each do |date|
      puts ""
      puts "Welcome to the Billboard Hot 100 for the week of #{date.week}!"
    end
  end

  def display_songs(input)
    case input.to_i
    when 1..10
      puts "Displaying songs 1 through 10"
      puts ""
      BillboardHot100::Song.all[0,10].each do |song|
        puts "#{song.rank}. #{song.name} by #{song.artist}"
      end
    when 11..20
      puts "Displaying songs 11 through 20"
      puts ""
      BillboardHot100::Song.all[10,10].each do |song|
        puts "#{song.rank}. #{song.name} by #{song.artist}"
      end
    when 21..30
      puts "Displaying songs 21 through 30"
      puts ""
      BillboardHot100::Song.all[20,10].each do |song|
        puts "#{song.rank}. #{song.name} by #{song.artist}"
      end
    when 31..40
      puts "Displaying songs 31 through 40"
      puts ""
      BillboardHot100::Song.all[30,10].each do |song|
        puts "#{song.rank}. #{song.name} by #{song.artist}"
      end
    when 41..50
      puts "Displaying songs 41 through 50"
      puts ""
      BillboardHot100::Song.all[40,10].each do |song|
        puts "#{song.rank}. #{song.name} by #{song.artist}"
      end
    when 51..60
      puts "Displaying songs 51 through 60"
      puts ""
      BillboardHot100::Song.all[50,10].each do |song|
        puts "#{song.rank}. #{song.name} by #{song.artist}"
      end
    when 61..70
      puts "Displaying songs 61 through 70"
      puts ""
      BillboardHot100::Song.all[60,10].each do |song|
        puts "#{song.rank}. #{song.name} by #{song.artist}"
      end
    when 71..80
      puts "Displaying songs 71 through 80"
      puts ""
      BillboardHot100::Song.all[70,10].each do |song|
        puts "#{song.rank}. #{song.name} by #{song.artist}"
      end
    when 81..90
      puts "Displaying songs 81 through 90"
      puts ""
      BillboardHot100::Song.all[80,10].each do |song|
        puts "#{song.rank}. #{song.name} by #{song.artist}"
      end
    when 91..100
      puts "Displaying songs 91 through 100"
      puts ""
      BillboardHot100::Song.all[90,10].each do |song|
        puts "#{song.rank}. #{song.name} by #{song.artist}"
      end
    end
  end

  def display_song(song)
    puts ""
    puts "#{song.name} by #{song.artist}"
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
      if song.award.length > 0 
        puts "Award: #{song.award}".colorize(:red)
      end
      if song.lyrics.length > 0 
        puts "Lyrics: #{song.lyrics.join}"
      end
  end

  def goodbye
    puts ""
    puts "Check back next week for the latest Billboard Hot 100!"
    puts ""
    exit
  end

end
