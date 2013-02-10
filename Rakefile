require "rubygems"
require "bundler/setup"

ROOT = File.absolute_path(File.dirname(__FILE__))
# Input
HAML_FOLDER   = File.join(ROOT, '/src/views')
COFFEE_FOLDER = File.join(ROOT, '/src/script')
# Output
HTML_FOLDER   = File.join(ROOT, '/')
JS_FOLDER     = File.join(ROOT, '/')

def html_path(file)
  File.absolute_path(file)
  file
  File.join(HTML_FOLDER, file.gsub(/^#{HAML_FOLDER}(.*)\.haml$/, '\1.html'))
end

def haml_convert(file)
   %x(haml #{file} #{html_path file} -f html5  -q --no-escape-attrs)
end

def print_convert(file)
  puts "#{Time.now.strftime("%Y/%m/%d %H:%M:%S")} #{file.gsub(/^#{ROOT}/, '')} => #{html_path(file).gsub(/^#{ROOT}/, '')}"
end

task :compile do 
  Dir.glob(File.join(ROOT, '**/*.haml')) do |file|
    haml_convert(file)
    print_convert(file)
  end
end

task :watch do 
  puts "Watching for changes"
  require 'fssm'
  FSSM.monitor(HAML_FOLDER, '**/*.haml') do
    update do |base, relative|   
      file = File.join(base, relative)
      haml_convert(file)
      print_convert(file)
    end
  end
end