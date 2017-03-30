$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'slug_fu'

RSpec.configure do |config|
  config.disable_monkey_patching!
  config.example_status_persistence_file_path = "spec/examples.txt"

  config.order = :random
  Kernel.srand config.seed
end
