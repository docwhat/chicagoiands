#!/usr/bin/env ruby

require 'pathname'

input = Pathname.new(__FILE__).dirname + 'times.md'

time = 0
input.open('r') do |f|
  f.each do |line|
    if line =~ /^\s*\*\s+(\d+)\s+hour/
      time += $1.to_i
    end
  end
end

puts "Hours: #{time}"
puts "Cost:  $#{time * 250}"

# EOF
