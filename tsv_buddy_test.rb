require_relative 'tsv_buddy'

class Tester
 include TsvBuddy
end

test_run = Tester.new
test_run.take_tsv(File.read('./data/test.tsv'))
puts test_run.to_tsv
