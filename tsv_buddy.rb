# Module that can be included (mixin) to create and parse TSV data
module TsvBuddy
  # @data should be a data structure that stores information
  #  from TSV or Yaml files. For example, it could be an Array of Hashes.
  attr_accessor :data

  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    yml_results = []
    header = []
    tsv_lines = tsv.split("\n")
    header = tsv_lines[0].split("\t")

    tsv_lines.shift
    tsv_lines.each do |line|
      value = line.split("\t")
      record = Hash.new(0)
      header.each_index { |index| record[header[index]] = value[index].chomp }
      yml_results << record
    end
    @data = yml_results
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    tsv_string = ''
    heading = ''
    data = @data

    data[0].each_key { |key| heading << key + "\t" }
    tsv_string << heading.strip
    tsv_string << "\n"

    0.upto(data.length - 1) do |index|
      record = ''
      data[index].each_value { |val| record << val + "\t" }
      tsv_string << record.strip
      tsv_string << "\n"
    end
    tsv_string
  end
end
