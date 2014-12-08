#!/usr/bin/env ruby

thisDir = File.expand_path(File.expand_path(File.dirname(__FILE__)))
homeDir = File.expand_path('~')

command = 'cd ' + thisDir
puts command
system(command)

%w{.zshrc .zshenv .zlogin}.each do |file|
	command = "ln -s  #{thisDir}/#{file} #{homeDir}"
	puts command
	system(command)
end


