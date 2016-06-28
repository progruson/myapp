require 'nokogiri'
require 'open-uri'

class DroiderParser
  def initialize
    @url = 'http://droider.ru/'
  end

  def download!
    html = open(@url)
    @doc = Nokogiri::HTML(html)
  end

  def parse
    @doc.css('.single').take(3).each do |showing|
      url_post  = showing.at_css('.title h2 a')['href']
      @doc.search('img', '.more-link').each do |el|
        el.remove
      end
      excerpt  = showing.css('.entry').to_html
      html_post = open(url_post)

      post = Nokogiri::HTML(html_post)
      post.css('#content').each do |elem|
        title_el    = elem.at_css('.title h2 a')
        title       = title_el.text.strip
        description = elem.css('.cover p, blockquote').to_html
        image_src   = elem.at_css('.entry img')['src']
        category    = elem.css('.category a').first.text.strip
        if category.nil?
          category  = 'Droider'
        end

        data = {
            :title        => title,
            :text_preview => excerpt,
            :content      => description,
            :source_link  => @url,
            :image_src    => image_src
        }

        if block_given?
          yield data, category
        end
      end
    end
  end
end
