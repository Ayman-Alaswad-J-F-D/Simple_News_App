class NewsListModel {
  final List<ArticlesModel> articles;

  NewsListModel({required this.articles});

  factory NewsListModel.fromJson(Map<String, dynamic> json) {
    return NewsListModel(
      articles: (json['articles'] as List)
          .map((article) => ArticlesModel.fromJson(article))
          .toList(),
    );
  }
}

class ArticlesModel {
  final String? title, publishedAt, url, urlToImage, description;

  ArticlesModel({
    this.title,
    this.description,
    this.publishedAt,
    this.urlToImage,
    this.url,
  });

  factory ArticlesModel.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) {
      return ArticlesModel();
    }
    return ArticlesModel(
      title: json["title"],
      description: json["description"],
      publishedAt: json["publishedAt"],
      urlToImage: json["urlToImage"],
      url: json["url"],
    );
  }
}
