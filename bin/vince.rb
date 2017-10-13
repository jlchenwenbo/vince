require 'rubygems'

Signal.trap("INT") {
    puts "\nCtrl-c detected. Exiting..."
    sleep 1
    exit
}

# find abs path for lib dir
lib = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(lib)

require 'vince'
require 'vince/cli'

Vince::CLI.start(ARGV)