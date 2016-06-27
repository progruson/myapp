namespace :parsing do

  def create_article(parser)
    parser.new.tap(&:download!).parse do |article_data, category_title|
      category = Category.find_or_create_by(title: category_title)
      article = Article.find_or_create_by! title: article_data[:title]

      article.update! article_data.merge(category: category)
    end
  end

  desc "TODO"
  task xakep: :environment do
    create_article XakepParser
  end

  desc "TODO"
  task fourpda: :environment do
    create_article FourpdaParser
  end

  desc "TODO"
  task droider: :environment do
    create_article DroiderParser
  end
end
