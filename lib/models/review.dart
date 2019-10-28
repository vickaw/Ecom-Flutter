class Review {
  double rating;
  String name, date;
  String content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";

  Review({this.rating, this.name, this.date});
}

List<Review> reviews = [
  Review(rating: 4.0, name: "Jane Doe", date: "10 Oct, 2019"),
  Review(rating: 3.5, name: "John Doe", date: "27 Jul, 2019"),
  Review(rating: 1.0, name: "Sam Smithy", date: "11 Jun, 2019"),
];