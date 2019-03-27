class BillboardHot100::CommandLineInteface

  def run
    BillboardHot100::Scraper.new.make_songs
    menu
    goodbye
  end
  
  def menu
    input = nil
    while input != "exit"
      puts "Welcome to the Billboard Hot 100 for the week of:"
      puts ""
      puts "Please enter the ranking you wish to see..."
      puts ""
      puts "Enter 1-10, 11-20, 21-30, 31-40, 41-50, 51-60, 61-70, 71-80, 81-90, 91-100 or type exit"
      input = gets.strip.to_i
      display_songs(input)
      puts ""
      puts "Please enter the song you want more information on or return to enter a new ranking."
      puts ""
      input = gets.strip
      song = BillboardHot100::Song.find(input.to_i)
      display_song(song)
    end
  end

  def display_songs(input)
    if input.to_i.between?(1,10)
      puts "Displaying 1 through 10"
      BillboardHot100::Song.all[0,10].each do |song|
        puts "#{song.rank}. #{song.name} by #{song.artist}"
      end
    elsif input.to_i.between?(11,20)
      puts "Displaying 11 through 20"
      BillboardHot100::Song.all[10,10].each do |song|
        puts "#{song.rank}. #{song.name} by #{song.artist}"
      end
    elsif input.to_i.between?(21,30)
      puts "Displaying 21 through 30"
      BillboardHot100::Song.all[20,10].each do |song|
        puts "#{song.rank}. #{song.name} by #{song.artist}"
      end
    elsif input.to_i.between?(31,40)
      puts "Displaying 31 through 40"
      BillboardHot100::Song.all[30,10].each do |song|
        puts "#{song.rank}. #{song.name} by #{song.artist}"
      end
    elsif input.to_i.between?(41,50)
      puts "Displaying 41 through 50"
      BillboardHot100::Song.all[40,10].each do |song|
        puts "#{song.rank}. #{song.name} by #{song.artist}"
      end
    elsif input.to_i.between?(51,60)
      puts "Displaying 51 through 60"
      BillboardHot100::Song.all[50,10].each do |song|
        puts "#{song.rank}. #{song.name} by #{song.artist}"
      end
    elsif input.to_i.between?(61,70)
      puts "Displaying 61 through 70"
      BillboardHot100::Song.all[60,10].each do |song|
        puts "#{song.rank}. #{song.name} by #{song.artist}"
      end
    elsif input.to_i.between?(71,80)
      puts "Displaying 71 through 80"
      BillboardHot100::Song.all[70,10].each do |song|
        puts "#{song.rank}. #{song.name} by #{song.artist}"
      end
    elsif input.to_i.between?(81,90)
      puts "Displaying 81 through 90"
      BillboardHot100::Song.all[80,10].each do |song|
        puts "#{song.rank}. #{song.name} by #{song.artist}"
      end
    elsif input.to_i.between?(91,100)
      puts "Displaying 91 through 100"
      BillboardHot100::Song.all[90,10].each do |song|
        puts "#{song.rank}. #{song.name} by #{song.artist}"
      end
    end
  end

  def display_song(song)
    puts "#{song.rank}. #{song.name} by #{song.artist}"
      if song.last_week.length > 0 && !song.last_week.include?("-")
        puts "Last Week: #{song.last_week}"
      end
      if song.peak_position.length > 0 
        puts "Peak Position: #{song.peak_position}"
      end
      if song.weeks_on_chart.length > 0 
        puts "Weeks On Chart: #{song.weeks_on_chart}"
      end
  end

  def goodbye
    puts "Check back next week for the latest Billboard Hot 100!"
  end

end
