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
    header = []
  
    tsv_lines = tsv.split("\n")
    header = tsv_lines[0].split("\t")

    tsv_lines.shift
    tsv_lines.each do |line|
      value = line.split("\t")
      record = Hash.new(0)
      header.each_index { |index| record[header[index]] = value[index].chomp}
      yml_results << record
    end
    @data = yml_results
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
   first_hash = @data[0]
   tsv_string = ''

   first_hash.each_with_index do |(key,_), index|

      if first_hash.length - 1 == index
          tsv_string << key
        else
          tsv_string << key + "\t"
      end
    end
   tsv_string << "\n"
   
   @data.each do |line|
    line.each_with_index do |(_,value), index|

      if line.length - 1 == index
          tsv_string << value
        else
          tsv_string << value + "\t"
      end
    end
     tsv_string << "\n"
   end
   tsv_string
 end

end
