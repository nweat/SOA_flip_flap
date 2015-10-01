require_relative 'tsv_buddy'

class Tester
 include TsvBuddy
end

tsv_test = Tester.new.take_tsv(File.read('./data/test.tsv'))