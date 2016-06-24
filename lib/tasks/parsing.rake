namespace :parsing do
  desc "TODO"
  task xakep: :environment do
    XakepParser.new.tap(&:download!).parse do |article_data|
      article = Article.find_or_create_by! title: article_data[:title]
      article.update! article_data
    end
  end

  desc "TODO"
  task fourpda: :environment do
    FourpdaParser.new.tap(&:download!).parse do |article_data|
      article = Article.find_or_create_by! title: article_data[:title]
      article.update! article_data
    end
  end

  desc "TODO"
  task droider: :environment do
    DroiderParser.new.tap(&:download!).parse do |article_data|
      article = Article.find_or_create_by! title: article_data[:title]
      article.update! article_data
    end
  end
end
