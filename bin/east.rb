# encoding: utf-8
#!/usr/bin/env ruby

# require 'east/cli'

# East::CLI.start(ARGV)

require 'east'

bank = East::Bank.new('hkb')
bank.async_count_file_size('./sql')
