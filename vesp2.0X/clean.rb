$uid = ""
$section = ""

def clean_source
  valid = true
  i = 1
  s = "0\n"
  first = true
  File.read($filename).split("\n").each { |line|
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
    new_name = "." + $shortname + "_clean.txt"
    File.write(new_name, s)
    create_submit_file
    system("cat #{new_name} - | ./a.out")
  end
end

def create_submit_file
  s = ""
  first = true
  File.read($filename).split("\n").each { |line|
    if line =~ /^([0-9a-fA-F]{1,4})(\s+[0-9a-fA-F]{1,4})?(?:\s+#(.*))?\s*$/
      if first
        first = false
      else
        s += $1.strip
        if $3 != nil
          s += "," + $3.strip
        end
        s += "\n"
        if $2 != nil
          s += $2.strip + ",.\n"
        end     
      end
    end
  }
  
  new_name = [$shortname.upcase, $section, $uid].join('_') + ".csv"
  File.write(new_name, s)
end

$filename = "#{ARGV[0]}"
$shortname = /^(?:.*\/)(\w+)/.match(ARGV[0]).captures[0]
clean_source
