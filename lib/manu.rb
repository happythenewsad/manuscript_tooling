module Manu
  class << self

    def chapter_header
      "\n#{'=' * 80}"
    end

    def title(s)
      begin 
        chapter_num, name, _ = s.match(/(\d+)(.+)(\..*)/).captures
        "Chapter #{chapter_num}:#{name.strip.gsub('-', ' ').upcase}"
      rescue => e 
        puts "title parse error: #{e}"
        'Chapter 000 - invalid chapter name'
      end
    end

    def format_file(path)
      relative_path = path.split('/').last
      begin
        title(relative_path) << chapter_header << "\n\n\n" << File.open(path).read << "\n"
      rescue => e
        puts "Unable to format file #{path}: #{e}"
        ''
      end
    end

    def format(src_dir, output_file_path)
      return unless Dir.exist? src_dir
      source_files = src_files(src_dir)

      manuscript = source_files.reduce("") do |memo, n|
        memo << format_file("#{src_dir}/#{n}")
      end
      File.open(output_file_path, 'a+') {|f| f << manuscript }
      puts "Compiled #{source_files.join(', ')} into #{output_file_path}."
    end

    def src_files(src_dir)
      entries = Dir.entries(File.expand_path(src_dir)).select do |entry|
        File.file?("#{src_dir}/#{entry}") && entry.match('.txt')
      end.sort
    end
  end

end

