require 'nokogiri'
require 'open-uri'
require 'net/https'

class XakepParser

  def initialize
    @url = 'https://xakep.ru/'
  end

  def download!
    html = open(@url)
    @doc = Nokogiri::HTML(html)
  end

  def parse
    @doc.css('.loop-panel').take(3).each do |showing|
      url_post  = showing.at_css('a')['href']
      excerpt  = showing.css('.excerpt').to_html
      html_post = open(url_post)

      post = Nokogiri::HTML(html_post)
      post.css('.post-right').each do |elem|
        title_el    = elem.at_css('.padded-panel h1')
        title       = title_el.text.strip
        description = elem.css('#content-anchor-inner p, blockquote, h2, h3, h4, h5, h6').to_html
        image_src   = elem.at_css('.featured-image-inner img')['src']
        category    = elem.css('.category-list a').first.text.strip
        if category.nil?
          category  = 'Xakep'
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