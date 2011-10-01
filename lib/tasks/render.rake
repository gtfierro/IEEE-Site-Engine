require 'fileutils'

def get_file_as_string(filename)
  contents = ''
  File.open(filename, 'r') do |f|
    while line = f.gets
      contents << line
    end
  end
  return contents
end

def write_string_as_file(filename, contents)
  File.open(filename, 'w') do |f|
    f.puts contents
  end
end