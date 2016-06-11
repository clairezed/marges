module Jekyll


  class TagPage < Page
    def initialize(site, base, dir, tag)
      # p "initialize TagPage"
      p dir
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'tag_page.html')
      self.data['tag'] = tag
      self.data['title'] = "Contenu avec le tag #{tag}"
    end
  end

  class TagPageGenerator < Generator
    safe true

    def generate(site)
      # p "generating Tag pages"
      if site.layouts.key? 'tag_page'
        dir = site.config['tag_dir'] || 'tags'
        site.tags.each_key do |tag|
          site.pages << TagPage.new(site, site.source, File.join(dir, tag), tag)
        end
      end
    end

  end


end