require 'nokogiri'
require 'open-uri'

class FourpdaParser
  def initialize
    @url = 'http://4pda.ru/news/'
  end

  def download!
    html = open(@url)
    @doc = Nokogiri::HTML(html, 'UTF-8')
    @doc.encoding = 'UTF-8'
  end

  def parse
    @doc.css('.post').take(3).each do |showing|
      url_post  = showing.at_css('a')['href']
      @excerpt  = showing.css('.description div').to_html
      html_post = open(url_post)

      post = Nokogiri::HTML(html_post)
      post.encoding = 'UTF-8'
      post.css('.container').each do |elem|
        title_el    = elem.at_css('.description h1 span')
        title       = title_el.text.strip
        description = elem.css('.content-box p').to_html
        image_src   = elem.at_css('.photo img')['src']
        # category    = elem.at_css('.category-list a').text.strip

        if block_given?
          yield :title       => title,
                :text_preview => @excerpt,
                :content     => description,
                :source_link => @url,
                :image_src   => image_src
        end
      end
    end
  end
end
