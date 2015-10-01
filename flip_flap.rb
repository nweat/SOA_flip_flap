require 'yaml'
require_relative 'tsv_buddy'
# FlipFlap
class FlipFlap
  include TsvBuddy

  def take_yaml(yml)
    @data = YAML.load(yml)
  end

  def to_yaml
    @data.to_yaml
  end
end
