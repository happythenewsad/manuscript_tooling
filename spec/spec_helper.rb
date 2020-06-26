Dir.entries(
  File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
).select {|f| f.include? '.rb'}.each {|f| require f }

RSpec.configure do |config|
end