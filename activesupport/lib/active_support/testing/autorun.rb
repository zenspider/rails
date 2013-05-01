# gem 'minitest'

# not sure why some test suites need this and others use load_paths.
dir = File.expand_path "~/Work/p4/zss/src/minitest/dev/lib"
$:.unshift dir unless $:.include?(dir)

require 'minitest/autorun'

Minitest.autorun
