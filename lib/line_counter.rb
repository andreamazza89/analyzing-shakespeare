require 'nokogiri'

class LineCounter

  def total_lines_per_speaker(xml_string)
    parsed_xml   = Nokogiri::XML(xml_string)
    speech_nodes = select_speech_nodes(parsed_xml)
    count_lines_per_speaker(speech_nodes)
  end

  private

  def select_speech_nodes(xml)
    xml.xpath("//SPEECH")
  end

  def count_lines_per_speaker(speech_nodes)
    lines_per_speaker = Hash.new(0)

    speech_nodes.each do |node|
      speaker = node.children[1].children[0].to_s
      total_lines = node.children.select { |child| child.node_name == "LINE" }.count
      lines_per_speaker[speaker] += total_lines 
    end

    lines_per_speaker
  end

end
