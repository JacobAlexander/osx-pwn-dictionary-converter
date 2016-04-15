require 'nokogiri'
require 'fileutils'

def get_files_to_convert
  files_to_convert = []
  # array dictionaries_to_convert
  Dir.glob("dictionaries_to_convert/*").each do |dict_path|
    # check if each dictionary have *.dict.dz files
    if !Dir.glob("#{dict_path}/*.dict.dz").empty?
      # puts "#{dict_path}"
      Dir.glob("#{dict_path}/*.dict.dz").each { |file| files_to_convert << file }
    end
  end
  return files_to_convert
end

def process!
  #array with file paths
  files = get_files_to_convert

  files.each do |file|
    new_file_name = file.rpartition("/").last.gsub!('dz', 'gz') #change file to gzip
    FileUtils.cp(file, "tmp/#{new_file_name}")
    # File.cop(file, "temp/#{new_file_name}")
    # File.replace(file, "temp/#{new_file_name}")
    # puts "temp/#{new_file_name}"
  end

  # puts files.inspect
end

# file_name = "1111.dict.dz"

# we need only *.ifo file
#  data = File.rename(file_name)
# data = File.read(')
#   xml_str = <<EOF
# <root>
#   <THING1:things type="Container">
#     <PART1:Id type="Property">1234</PART1:Id>
#     <PART1:Name type="Property">The Name1</PART1:Name>
#   </THING1:things>
#   <THING2:things type="Container">
#     <PART2:Id type="Property">2234</PART2:Id>
#     <PART2:Name type="Property">The Name2</PART2:Name>
#   </THING2:things>
# </root>
# EOF
#
#   doc = Nokogiri::XML(xml_str)
#   doc.xpath('//things').each do |thing|
#     puts "ID   = " + thing.at_xpath('Id').content
#     puts "Name = " + thing.at_xpath('Name').content
#   end

process!