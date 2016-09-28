s = "0\n"
filename = /^(?:.*\/)(\w+)/.match(ARGV[0]).captures[0]
valid = true
i = 1
first = true
File.read("#{ARGV[0]}").split("\n").each { |line|
  if line =~ /^([0-9a-fA-F]{1,4})(?:\s+([0-9a-fA-F]{1,4}))?(?:\s+#.*)?\s*$/
    s += $1 + "\n"
    if first
      s += "0\n"
      first = false
    end
    if ($2 != nil)
      s += $2 + "\n"
    end
  elsif not line =~ /^\s*(#.*)?$/
    puts "Error (line #{i}): #{line}"
    valid = false
  end
  i += 1
}

if valid
  s += "-1\n0\n"
  new_name = "." + filename + "_clean.txt"
  File.write(new_name, s)
  system("cat #{new_name} - | ./a.out")
end
