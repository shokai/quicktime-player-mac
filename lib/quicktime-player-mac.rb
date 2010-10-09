$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

Dir.glob(File.dirname(__FILE__)+'/quicktime-player-mac/*.rb').each{|lib|
  require lib
}

module QuicktimePlayerMac
  VERSION = '0.0.1'
end
