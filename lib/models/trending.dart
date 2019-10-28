import '../utils/utils.dart';

class Trending {
  String description, photo;

  Trending({this.description, this.photo});
}

List<Trending> trendingItems = [
  Trending(description: "Look soft like a Pastel this winter", photo: AppImages.shopSlider1),
  Trending(description: "Check out what Men absolutely love!", photo: AppImages.shopSlider2),
];
