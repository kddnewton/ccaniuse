file "configure" => ["configure.ac"] do
  sh "autoconf"
end

file "config.h" => ["configure"] do
  sh "./configure"
end

file "defines.json" => ["config.h"] do
  require "json"

  defines = File.read("config.h").scan(/-D(.+?)=(.+?)\s/).to_h
  File.write("defines.json", JSON.pretty_generate(defines))
end
