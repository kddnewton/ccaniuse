# frozen_string_literal: true

require "rake/clean"

file "configure" => ["configure.ac"] do
  sh "autoconf"
end

file "config.h" => ["configure"] do
  begin
    sh "./configure"
  rescue
    warn(File.read("config.log"))
    raise
  end
end

file "defines.json" => ["config.h"] do
  require "json"

  defines = File.read("config.h").scan(/-D(.+?)=(.+?)\s/).to_h
  File.write("defines.json", JSON.pretty_generate(defines))
end

file "grouped.json" do
  require "json"

  grouped = {}
  Dir.glob("defines-*/defines.json").each do |filename|
    grouped[filename[%r{defines-(.+)/defines\.json}, 1]] =
      JSON.parse(File.read(filename))
  end

  File.write("grouped.json", JSON.pretty_generate(grouped))
end

CLOBBER.push(
  "configure",
  "config.h",
  "defines.json",
  "grouped.json"
)
