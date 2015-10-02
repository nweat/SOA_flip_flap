require_relative 'tsv_buddy'
# Testing functionalities
class Tester
  include TsvBuddy
end

test_run = Tester.new
test_run.take_tsv(File.read('./data/survey.tsv'))
test_run.to_tsv
