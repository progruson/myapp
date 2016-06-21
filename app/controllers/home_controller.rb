class HomeController < ApplicationController
  def index
    require 'nokogiri'
    require 'open-uri'
    require 'net/https'

    doc = Nokogiri::HTML(open('https://xakep.ru/'))

    @info = doc.css('.loop .loop-panel a').take(3).each do |elem|
      @link_post = elem['href']
      doc = Nokogiri::HTML(open(@link_post))
      
    end

    # @info = doc.xpath('//channel//item').take(3).map do |i|
    #   News.create(:title => i.xpath('title').inner_text, :content => i.xpath('description').inner_text, :link => i.xpath('link').inner_text)
    # end

    # @arr = []
    # @info = doc.css('.article-title span').take(3).each do |elem|
    #   # New.create(:title => elem.content)
    #   @arr[@arr.size] = elem.content
    # end
  end
end



# class NewsController < InheritedResources::Base
#   def new
#     require 'nokogiri'
#     doc = Nokogiri::XML(open("http://www.rollingstone.com/siteServices/rss/musicNewsAndFeature"))
#     @info = doc.xpath('//item').take(5).map do |i|
#       News.create(:title => i.xpath('title').inner_text, :description => i.xpath('description').inner_text, :link => i.xpath('link').inner_text)
#     end
#   end
# end