# Module that can be included (mixin) to create and parse TSV data
module TsvBuddy
  # @data should be a data structure that stores information
  #  from TSV or Yaml files. For example, it could be an Array of Hashes.
  attr_accessor :data

  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    tsv_lines = []
    yml_results = []
  
    tsv_lines = tsv.split("\n")
    header = tsv_lines[0].split("\t")
    #header.map!(&:chomp)

    tsv_lines.shift
    tsv_lines.each do |line|
      value = line.split("\t")
      record = Hash.new(0)
      header.each_index { |index| record[header[index]] = value[index].chomp }
      yml_results << record
    end
    @data = yml_results
    @data
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv

  end
end
