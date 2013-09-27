require 'rake'

task :default => [:install]

desc 'Install the dotfiles.'
task :install do
  Dir.glob('**/*.symlink').each do |filename|
    basename = File.basename(filename, File.extname(filename))
    old_path = File.absolute_path(File.join(File.dirname(filename), basename))
    if basename.match(/\.local$/) && !File.file?(old_path)
      File.new old_path
    end
    new_path = File.expand_path("~/.#{basename}")

    if !File.symlink?(new_path)
      File.symlink(old_path, new_path)
    elsif File.readlink(new_path) != old_path
      File.unlink(new_path) && File.symlink(old_path, new_path)
    else
      puts "Already linked: #{new_path} --> #{old_path}"
    end
  end
end
