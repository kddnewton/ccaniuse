require "rake/clean"

file "configure" => ["configure.ac"] do
  sh "autoconf"
end

file "config.h" => ["configure"] do
  begin
    sh "./configure"
  rescue
    puts File.read("config.log")
    raise
  end
end

file "defines.json" => ["config.h"] do
  require "json"

  defines = File.read("config.h").scan(/-D(.+?)=(.+?)\s/).to_h
  File.write("defines.json", JSON.pretty_generate(defines))
end

CLOBBER.push(
  "configure",
  "config.h",
  "defines.json"
)
