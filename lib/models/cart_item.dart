class CartItem {
  int id, number;
  String name, photo, size;
  String color;
  double price;

  CartItem({
    this.id,
    this.name,
    this.photo,
    this.size,
    this.color,
    this.price,
    this.number,
  });

  CartItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
    size = json['size'];
    color = json['color'];
    price = json['price'];
    number = json['number'] ?? 1;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['size'] = this.size;
    data['color'] = this.color;
    data['price'] = this.price;
    data['number'] = this.number;
    return data;
  }
}
