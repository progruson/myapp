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
      html_post = open(url_post)

      post = Nokogiri::HTML(html_post)
      post.css('#content').each do |elem|
        title_el    = elem.at_css('.title h2 a')
        title       = title_el.text.strip
        description = elem.at_css('.cover').text.strip
        image_src   = elem.at_css('.entry img')['src']
        # category    = elem.at_css('.category-list a').text.strip

        if block_given?
          yield :title       => title,
                :content     => description,
                :source_link => @url,
                :image_src   => image_src
        end
      end
    end
  end
end
