#!/bin/ruby
#
# Toggle timezones in i3blocks
# Author: Vivien Didelot <vivien.didelot@gmail.com>
#
# Fill the ZONES array and define a block like this:
#
# [timezone]
# command=THIS_SCRIPT
# interval=5

ZONES = [
  "US/Eastern",
  "UTC",
]

CACHE = "/tmp/tz"

def datetime zone, format
%x(TZ=#{ zone } date '+#{ format }')
end

def get_timezone
zone = ZONES.first

# toggle on click
if ENV["BLOCK_BUTTON"].to_i > 0
if File.exist? CACHE
cached = File.read(CACHE)
zone = cached if ZONES.include? cached
end

index = ZONES.index(zone) || -1
index = (index + 1) % ZONES.size
zone = ZONES[index]

# cache the timezone
File.open(CACHE, 'w') { |f| f.write(zone) }
end

zone
end

zone = get_timezone
city = zone.split('/').last

full_text = "#{ city }: #{ datetime(zone, "%D %T") }"
short_text = "#{ city.chars.first }: #{ datetime(zone, "%T") }"
color = "#00FF00"

# output the block
puts full_text
puts short_text
puts color

# vim: ts=2 sw=2 et
