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
      html_post = open(url_post)

      post = Nokogiri::HTML(html_post)
      post.css('.post-right').each do |elem|
        title_el    = elem.at_css('.padded-panel h1')
        title       = title_el.text.strip
        description = elem.at_css('#content-anchor-inner').text.strip
        image_src   = elem.at_css('.featured-image-inner img')['src']
        # category    = elem.at_css('.category-list a').text.strip

        if block_given?
         yield :title   => title,
          :content      => description,
          :source_link  => @url,
          :image_src    => image_src
        end
      end
    end
  end
end