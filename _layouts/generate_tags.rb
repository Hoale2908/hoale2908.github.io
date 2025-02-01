Jekyll::Hooks.register :site, :post_write do |site|
    dir = "tag"
    FileUtils.mkdir_p(dir)
    site.tags.each do |tag, posts|
      File.open(File.join(dir, "#{tag}.html"), "w") do |file|
        file.puts "---"
        file.puts "layout: tag"
        file.puts "title: Tag: #{tag}"
        file.puts "tag: #{tag}"
        file.puts "---"
      end
    end
  end