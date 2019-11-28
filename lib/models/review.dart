class Review {
  double rating;
  String name, date;
  String content;

  Review({this.rating, this.name, this.date, this.content});
}

List<Review> reviews = [
  Review(rating: 4.0, name: "Jane Doe", date: "10 Oct, 2019", content: "Thanks, the product is awesome"),
  Review(rating: 3.5, name: "John Doe", date: "27 Jul, 2019", content: "Well, it is not so bad"),
  Review(rating: 1.0, name: "Sam Smithy", date: "11 Jun, 2019", content: "I did not like the product, and i wasn't refunded."),
];