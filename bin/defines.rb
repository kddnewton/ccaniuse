require "json"

Dir.chdir(File.expand_path("..", __dir__)) do
  defines =
    File.foreach("config.h", chomp: true).to_h do |pair|
      case pair
      when %r{^#define (\S+) (.*)$}
        [$1, $2]
      when %r{^/\* #undef (\S+) \*/$}
        [$1, nil]
      else
        raise "Invalid line: #{pair}"
      end
    end

  File.write("defines.json", JSON.pretty_generate(defines))
end
