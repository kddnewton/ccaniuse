require "json"

Dir.chdir(File.expand_path("..", __dir__)) do
  grouped = {}
  Dir.glob("defines-*/defines.json").each do |filename|
    grouped[filename[%r{defines-(.+)/defines\.json}, 1]] =
      JSON.parse(File.read(filename))
  end

  File.write("grouped.json", JSON.pretty_generate(grouped))
end
