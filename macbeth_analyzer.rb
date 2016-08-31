require_relative './lib/line_counter'
require 'net/http'

document = Net::HTTP.get('ibiblio.org', '/xml/examples/shakespeare/macbeth.xml')

counter = LineCounter.new

total_lines_per_speaker = counter.total_lines_per_speaker(document)
total_lines_per_speaker.delete("ALL")
total_lines_per_speaker.each {|speaker, lines| puts "#{lines} #{speaker}"}
