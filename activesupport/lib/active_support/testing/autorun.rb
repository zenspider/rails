# gem 'minitest'

# not sure why some test suites need this and others use load_paths.
$:.unshift File.expand_path "~/Work/p4/zss/src/minitest/dev/lib"

require 'minitest/autorun'

Minitest.autorun
