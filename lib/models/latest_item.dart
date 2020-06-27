import '../utils/utils.dart';

class LatestItem {
  String description, photo;

  LatestItem({this.description, this.photo});
}

List<LatestItem> latestItems = [
  LatestItem(description: "Travis vitamin E natural solutions for your skin", photo: AppImages.vitamine),
  LatestItem(description: "Natural perfumes are gold", photo: AppImages.fragrance),
  LatestItem(description: "Awesome premium quality kids wears", photo: AppImages.kid2),
];
