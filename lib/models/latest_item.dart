import '../utils/utils.dart';

class LatestItem {
  String description, photo;

  LatestItem({this.description, this.photo});
}

List<LatestItem> latestItems = [
  LatestItem(description: "For all your summer clothing needs", photo: AppImages.woman),
  LatestItem(description: "Newest men polo fashion silk wears", photo: AppImages.man),
  LatestItem(description: "Awesome premium quality kids wears", photo: AppImages.kid2),
];
