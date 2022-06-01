#!/usr/bin/env ruby
# frozen_string_literal: true

# delete-script.rb
# Usage: ./delete-script.rb [dir]
#
# Args:
# dir [Optional]: directory to recursively process. Default: .
#
# Recursively opens all '.md' files in `dir`.
# If it finds a matching pair of `<!-- REM` `REM -->` markers,
# it deletes the block of text containing the markers,
# adds the file to git's stage area and creates a commit
# with the message `rm(<file path>): <text behind opening REM marker>`.
#
# You usually want to execute this in the markdown directory without any arguments.
# (Or pass 'markdown' to this script)
#
# Alternatively, simply use the makefile in the root of this repo.

START_MARKER = '<!-- REM'
END_MARKER = 'REM -->'
FILE_EXT = '.md'

class RemSyntaxError < StandardError
end

def remove_block(path, start_line, message, end_line, initial_path)
  scope = path.delete_suffix(File.extname(path))
  scope = if initial_path.end_with?('/')
            scope.delete_prefix(initial_path)
          else
            scope.delete_prefix(initial_path + '/')
          end

  commit = "rm(#{scope}): #{message}"

  puts "Deleting #{path}:#{start_line + 1} - #{path}:#{end_line + 1} with commit message '#{commit}'"

  lines = IO.readlines(path)

  File.open(path, mode: 'w') do |f|
    lines.each_with_index do |line, index|
      f.write(line) if index < start_line || index > end_line
    end
  end

  system("git add '#{path}'", exception: true)
  system("git commit -m '#{commit}'", exception: true)
end

def process_file_once(path, initial_path)
  start_line = false
  message = ''
  end_line = false

  IO.readlines(path).each_with_index do |line, index|
    if !start_line && line.start_with?(START_MARKER)
      start_line = index
      message = line.delete_prefix(START_MARKER + '').strip
    elsif start_line
      if line.start_with?(END_MARKER)
        end_line = index
      elsif line.start_with?(START_MARKER)
        raise RemSyntaxError, "Found nested '#{START_MARKER}' at #{path}:#{index + 1}!"\
          "(outer block starts at L#{start_line + 1})"
      end
    elsif line.start_with?(END_MARKER)
      raise RemSyntaxError, "Found '#{END_MARKER}' without corresponding '#{START_MARKER}' at #{path}:#{index + 1}"
    end

    break if end_line
  end

  if start_line && !end_line
    raise RemSyntaxError, "Missing '#{END_MARKER}' at #{path}:EOF! (block starts at L#{start_line + 1})"
  elsif start_line && end_line
    remove_block(path, start_line, message, end_line, initial_path)
    true
  else
    false
  end
end

def process_file_all(file, initial_path)
  # process file until there are no more blocks to be removed
  deleted = true
  deleted = process_file_once(file, initial_path) while deleted
end

def process_dir(path, initial_path)
  errors = []

  Dir.each_child(path) do |entry|
    entry_path = File.join(path, entry)

    if Dir.exist?(entry_path)
      errors += process_dir(entry_path, initial_path)
    elsif File.file?(entry_path) && File.extname(entry_path) == FILE_EXT
      begin
        process_file_all(entry_path, initial_path)
      rescue StandardError => e
        errors << e
      end
    end
  end

  errors
end

dir = if ARGV.length == 1
        ARGV[0]
      else
        '.'
      end
errors = process_dir(dir, dir)
errors.each do |error|
  warn "#{error.class}: #{error.message}"
end
