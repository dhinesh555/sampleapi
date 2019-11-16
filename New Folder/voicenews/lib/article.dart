class Article {
  String title, author, description, urlToImage, content;
  DateTime publishedAt;

  Article(
      {this.author,
      this.title,
      this.description,
      this.content,
      this.publishedAt,
      this.urlToImage});
}
