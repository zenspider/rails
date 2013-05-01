# bust gem prelude
require 'bundler'
Bundler.setup

# fuck you bundler... jesus christ
dir = File.expand_path "~/Work/p4/zss/src/minitest/dev/lib"
$:.unshift dir unless $:.include?(dir)
