require 'nokogiri'
require 'open-uri'

class FourpdaParser
  def initialize
    @url = 'http://4pda.ru/news/'
  end

  def download!
    html = open(@url)
    @doc = Nokogiri::HTML(html)
  end

  def parse
    @doc.css('.post').take(3).each do |showing|
      url_post  = showing.at_css('a')['href']
      html_post = open(url_post)

      post = Nokogiri::HTML(html_post)
      post.css('.container').each do |elem|
        title_el    = elem.at_css('.description h1 span')
        title       = title_el.text.strip
        description = elem.at_css('.content-box').text.strip
        description = description.css("style,script").remove
        image_src   = elem.at_css('.photo img')['src']
        # category    = elem.at_css('.category-list a').text.strip

        if block_given?
          yield :title => title,
              :content => description,
              :source_link => @url,
              :image_src => image_src
        end
      end
    end
  end
end
