require 'fileutils'
require 'less'

task :css do
  less_path = "less/#{Ieee::Application::THEME}"
  css_path = "public/stylesheets/#{Ieee::Application::THEME}"
  parser = Less::Parser.new :paths => [less_path]
  
  if File.exists?(css_path)
    FileUtils.rm Dir.glob("#{css_path}/*.css")
  else
    Dir.mkdir(css_path)
  end
  
  Dir.glob("#{less_path}/*.less") do |less_file|
    css_file = File.basename(less_file).sub('.less', '.css')
    contents = get_file_as_string(less_file)    
    tree = parser.parse(contents)
    write_string_as_file("#{css_path}/#{css_file}", tree.to_css)
  end
end

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