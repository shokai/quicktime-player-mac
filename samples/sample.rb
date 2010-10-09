#!/usr/bin/env ruby
require 'rubygems'
require File.dirname(__FILE__)+'/../lib/quicktime-player-mac'
#require 'quicktime-player-mac'

$VERBOSE = nil

q = QuickTime.new
q.play unless q.playing?
q.speed = 13.5
puts "speed : #{q.speed}"
loop do
  if q.current_time > 100
    q.speed = 0.5
    puts "speed : #{q.speed}"
    break
  end
end

loop do
  if q.current_time > 110
    q.current_time = 30
    puts "current_time : #{q.current_time}"
    break
  end
end
