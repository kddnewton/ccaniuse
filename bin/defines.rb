require "json"

Dir.chdir(File.expand_path("..", __dir__)) do
  pairs = File.read("config.h").chomp.split(/ ?\-D/).drop(1)

  defines = pairs.to_h { |pair| pair.split("=") }
  defines.delete("PACKAGE_NAME")
  defines.delete("PACKAGE_TARNAME")
  defines.delete("PACKAGE_VERSION")
  defines.delete("PACKAGE_STRING")
  defines.delete("PACKAGE_BUGREPORT")
  defines.delete("PACKAGE_URL")

  File.write("defines.json", JSON.pretty_generate(defines))
end
