require 'fileutils'
require 'rake'
require 'set'

# utils ------------------------------------------------------------------- {{{
def file_listing(end_pattern)
  files = Dir.glob("locations/**/*#{end_pattern}").map do |name|
    old_base = File.join(File.dirname(name), File.readlink(name)).chomp('.template')
    new_base = name.sub(/^locations\//, '').chomp(end_pattern)

    old_path = File.expand_path(old_base)
    new_path = File.expand_path("~/.#{new_base}")
    { old_path: old_path, new_path: new_path }
  end

  files.to_set
end

def directory_listing
  file_listing('.directory.symlink')
end

def locals_listing
  file_listing('.symlink').select do |f|
    f[:new_path].match('\.local$')
  end
end

def dotfile_listing
  file_listing('.symlink').select do |f|
    !f[:new_path].match('\.directory$') && !f[:new_path].match('\.local$')
  end
end

def current_file(f)
  _old_path, new_path = f[:old_path], f[:new_path]

  if File.directory? new_path
    { type: :directory, path: new_path, old_path: new_path, new_path: new_path }
  elsif File.symlink? new_path
    { type: :symlink, path: new_path, old_path: File.expand_path(File.readlink(new_path)), new_path: new_path }
  elsif File.file? new_path
    { type: :file, path: new_path, old_path: new_path, new_path: new_path }
  else
    { type: nil, path: new_path, old_path: new_path, new_path: new_path }
  end
end

def maybe_overwrite_symlink!(old_link, new_link, noinput = false)
  if noinput
    puts "Warn!  | Overwrite | path: #{new_link[:new_path]}, old: #{old_link[:old_path]}, new: #{new_link[:old_path]}"
    FileUtils.ln_sf new_link[:old_path], new_link[:new_path]
  else
    print "Warn!  | Prompt    | #{new_link[:new_path]} already exists and points to #{old_link[:old_path]}! overwrite? (y/n): "
    input = gets.chomp.strip.downcase
    if input == 'y' || input == 'yes'
      puts "Warn!  | Overwrite | path: #{new_link[:new_path]}, old: #{old_link[:old_path]}, new: #{new_link[:old_path]}"
      FileUtils.ln_sf new_link[:old_path], new_link[:new_path]
    else
      puts "Info   | Info      | not overwriting link: #{new_link[:new_path]}, current_val: #{old_link[:old_path]}"
    end
  end
end

def maybe_overwrite_file!(old_file, new_link, noinput = false)
  if noinput
    puts "Warn!  | Overwrite | file: #{new_link[:new_path]}"
    FileUtils.rm old_file[:path]
    FileUtils.ln_s new_link[:old_path], new_link[:new_path]
  else
    print "Warn!  | Prompt    | #{old_file[:path]} already exists! overwrite? (y/n): "
    input = gets.chomp.strip.downcase
    if input == 'y' || input == 'yes'
      puts "Warn!  | Overwrite | file: #{old_file[:path]}"
      FileUtils.rm old_file[:path]
      FileUtils.ln_s new_link[:old_path], new_link[:new_path]
    else
      puts "Info   | Info      | not overwriting file: #{new_link[:new_path]}"
    end
  end
end

def symlink_file(new_link, noinput = false)
  old_path, new_path = new_link[:old_path], new_link[:new_path]
  old_file = current_file(new_link)

  case old_file[:type]
  when :directory
    puts "Error! | Exists    | #{new_path} : directory"
    false
  when :symlink
    if old_file[:old_path] != old_path
      maybe_overwrite_symlink!(old_file, new_link, noinput)
    else
      puts "Info   | Exists    | #{new_path} --> #{old_path}"
    end
  when :file
    maybe_overwrite_file!(old_file, new_link, noinput)
  when nil
    puts "Info   | Linking   | #{new_path} --> #{old_path}"
    FileUtils.ln_s new_link[:old_path], new_link[:new_path]
  end
end
# /utils ------------------------------------------------------------------ }}}

# rake tasks -------------------------------------------------------------- {{{
task :ensure_directories_exist do
  directory_listing.each do |d|
    puts "Info   | Touch     | #{d[:new_path]}"
    FileUtils.mkdir_p d[:new_path]
  end
end

task :ensure_locals_exist do
  locals_listing.each do |f|
    puts "Info   | Touch     | #{f[:old_path]}"
    FileUtils.touch f[:old_path]
    symlink_file(f, true)
  end
end

task :ensure_links_exist => [:ensure_directories_exist, :ensure_locals_exist] do
  dotfile_listing.each do |f|
    symlink_file(f, true)
  end
end

task :default => :ensure_links_exist
# /rake tasks ------------------------------------------------------------- }}}
