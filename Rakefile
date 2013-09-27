require 'fileutils'
require 'rake'

task :default => [:install]

desc 'Install the dotfiles.'
task :install do
  Dir.glob('**/*.symlink').each do |filename|
    basename = File.basename(filename, File.extname(filename))
    old_path = File.absolute_path(File.join(File.dirname(filename), basename))
    if basename.match(/\.local$/) && !File.file?(old_path)
      FileUtils.touch old_path
    end
    new_path = File.expand_path("~/.#{basename}")

    if !File.file?(new_path)
      File.symlink(old_path, new_path)
    elsif File.symlink?(new_path) && File.readlink(new_path) != old_path
      File.unlink(new_path) && File.symlink(old_path, new_path)
    elsif File.symlink?(new_path)
      puts "Already linked: #{new_path} --> #{old_path}"
    else
      puts "Not modifying existent file: #{new_path}"
    end
  end
end
