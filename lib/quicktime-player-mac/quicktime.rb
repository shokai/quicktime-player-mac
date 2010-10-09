require 'rubygems'
require 'applescript'

class QuickTime

  class Error < Exception
  end

  attr_accessor :movie_index

  def initialize(movie_index=1)
    @movie_index = movie_index
  end

  def speed=(speed)
    raise ArgumentError.new('speed should be Number') if speed.class != Fixnum and speed.class != Float
    @speed = speed
    script = 
"tell application 'QuickTime Player'
  set preferred rate of document 1 to #{speed}
  tell movie #{@movie_index}
    if playing then
      play
    end if
  end tell
end tell".gsub(/'/,'"')
    AppleScript.execute(script)
  end

  def speed
    script = 
"tell application 'QuickTime Player'
  get preferred rate of document 1
end tell".gsub(/'/,'"')
    AppleScript.execute(script).to_f
  end

  def stop
    script = 
"tell application 'QuickTime Player'
  tell movie #{@movie_index}
    stop
  end tell
end tell".gsub(/'/,'"')
    AppleScript.execute(script)
  end

  def play
    script = 
"tell application 'QuickTime Player'
  tell movie #{@movie_index}
    play
  end tell
end tell".gsub(/'/,'"')
    AppleScript.execute(script)
  end

  def playing?
    script =
"tell application 'QuickTime Player'
  tell movie #{@movie_index}
    playing
  end tell
end tell".gsub(/'/,'"')
    res = AppleScript.execute(script)
    return true if res =~ /^true/
    return false if res =~ /^false/
    raise Error.new("couldn't get playing status")
  end

  def current_time
    script =
"tell application 'QuickTime Player'
  tell movie #{@movie_index}
    get current time
  end tell
end tell".gsub(/'/,'"')
    res = AppleScript.execute(script)
    res.to_f/600
  end

  def current_time=(sec)
    sec = sec*600
    script = 
"tell application 'QuickTime Player'
  tell movie #{@movie_index}
    set current time to #{sec}
  end tell
end tell".gsub(/'/, '"')
    res = AppleScript.execute(script)
  end

  def movies
    script =
"tell application 'QuickTime Player'
  get documents
end tell".gsub(/'/,'"')
    res = AppleScript.execute(script)
  end

end
