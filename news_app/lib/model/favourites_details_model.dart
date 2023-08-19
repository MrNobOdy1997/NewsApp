class FavouriteData{
  int newsId;
  String newsTitle;
  String newsDescription;
  String newsImageUrl;
  String newsWebUrl;
  FavouriteData({required this.newsId,required this.newsTitle,required this.newsDescription,required this.newsImageUrl, required this.newsWebUrl});
  Map<String, dynamic> toMap() {
    return {'newsId': newsId, 'newsTitle': newsTitle,'newsDescription':newsDescription,'newsImageUrl':newsImageUrl,'newsWebUrl':newsWebUrl};

  }
}