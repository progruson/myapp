class HomeController < ApplicationController
  def index
    require 'nokogiri'
    require 'open-uri'
    require 'net/https'

    url = 'https://xakep.ru/'
    html = open(url)

    doc = Nokogiri::HTML(html)
    # @showings = []
    doc.css('.loop-panel').take(3).each do |showing|
      url_post  = showing.at_css('a')['href']
      html_post = open(url_post)

      post = Nokogiri::HTML(html_post)
      post.css('.post-right').each do |elem|
        title_el    = elem.at_css('.padded-panel h1')
        title       = title_el.text.strip
        description = elem.at_css('#content-anchor-inner').text.strip
        image_src   = elem.at_css('.featured-image-inner img')['src']
        category    = elem.at_css('.category-list a').text.strip
        # @showings.push(
        #     title:       title,
        #     description: description,
        #     image:       image_src,
        #     category:    category,
        #     source_link: url
        # )
        # Category.create(:title => category)
        # New.create(
        #     :title => title,
        #     :category_id => '#',
        #     :content => description,
        #     :source_link => url,
        #     :image_src => image_src
        # )
      end
    end
  end
end