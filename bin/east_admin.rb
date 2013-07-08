# encoding: GBK

require 'optparse'
require 'pathname'
require 'yaml'
require '../lib/east'

options = {}
OptionParser.new do |opts|
  executable_name = File.basename($PROGRAM_NAME)
  opts.banner = "Load data from directory to database
  
Usage: #{executable_name} [options] [directory...]
  
"
  opts.on("-c") do
    options[:command] = true
  end

end.parse!

LICENSE_NUMBER = 'B0187H242010002'
GATHER_DATE = '20130629'
SCHEMA = 'HKYH'

data_dir = ARGV.shift
gather_date = ARGV.shift || GATHER_DATE
if data_dir && File.exists?(data_dir)
  bank = East::Bank.new(SCHEMA, LICENSE_NUMBER)
  if options[:command]
    bank.generate_command(data_dir, gather_date)
  else
    bank.load_data(data_dir, gather_date)
  end
else
  STDERR.puts "Error: 请输入数据目录参数"
  exit 1
end
# files = []
# if ARGV.empty?
#   files << Dir[Pathname.new(Dir.pwd).join("*.txt")]
# else
#   ARGV.each do |path|
#     if File.directory?(path)
#       files << Dir[Pathname.new(path).join("*.txt")]
#     else
#       files << Pathname.new(path)
#     end
#   end
# end
# files.flatten!
# 
# importer = East::DataImporter.new(options, files)
# importer.process

# vim:shiftwidth=2:softtabstop=2:filetype=ruby:
