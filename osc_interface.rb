#!/usr/bin/env ruby

require 'rubygems'
require 'thread'
require 'osc-ruby'
require 'osc-ruby/em_server'

@server = OSC::EMServer.new(7002)
@client = OSC::Client.new('localhost', 7001)

# Ni Mate /url
@server.add_method '/greeting' do |message|
  puts "Received -> #{message.ip_address}:#{message.ip_port} -- #{message.address} -- #{message.to_a}"
  @client.send( OSC::Message.new("/ArenaURL", "1") )
end

Thread.new do
  @server.run
end

# Local Test
# @client = OSC::Client.new('localhost', 7002)
# @client.send( OSC::Message.new("/greeting", "hullo!") )

puts "=== OSC Interface Initalized ==="

loop do 
end
