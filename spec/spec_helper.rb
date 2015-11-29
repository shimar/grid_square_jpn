require "simplecov"

SimpleCov.start do
  add_filter "/vendor/"
  add_filter "/spec"
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'grid_square_jpn'
