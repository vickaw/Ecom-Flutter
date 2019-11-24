import '../utils/utils.dart';

class Product {
  int id;
  String name;
  String description = "Something";
  List<String> photos;
  List<String> sizes;
  List<ProductColor> colors;
  double price, rating;
  String brand, material, category;
  String sku = "1234567890";
  String condition = "Brand New";
  String fitting = "True to Size";

  Product({
    this.id,
    this.name,
    this.sizes,
    this.price,
    this.rating,
    this.photos,
    this.colors,
    this.brand,
    this.material,
    this.category,
  });
}

class ProductColor {
  String name, color;

  ProductColor({this.name, this.color});
}

List<Product> products = [
  Product(
    id: 1,
    name: "Race Shoe",
    sizes: ["6.5", "7.0", "8.0"],
    price: 89.99,
    rating: 4.6,
    photos: [
      AppImages.runningShoesBlack,
      AppImages.runningShoesBlue,
    ],
    colors: [
      ProductColor(name: "Black", color: "#0F0C0B"),
      ProductColor(name: "Blue", color: "#104FE4"),
    ],
    brand: "Super Running Shoes",
    material: "Leather",
    category: "Men Shoes"
  ),
  Product(
    id: 2,
    name: "Nike Shoe",
    sizes: ["6.5", "7.0", "8.0", "9.0"],
    price: 150.00,
    rating: 5.0,
    photos: [
      AppImages.nikeShoeRed,
    ],
    colors: [
      ProductColor(name: "Red", color: "#932528"),
    ],
    brand: "Nike",
    material: "Leather",
    category: "Men Shoes"
  ),
  Product(
    id: 3,
    name: "Ankle Boots",
    sizes: ["4.5", "5.0", "6.5", "7.0", "8.0"],
    price: 49.99,
    rating: 4.9,
    photos: [
      AppImages.bootsBlack,
      AppImages.bootsMushroom,
      AppImages.bootsHthrGrey,
    ],
    colors: [
      ProductColor(name: "Black", color: "#1E1E1E"),
      ProductColor(name: "Mushroom", color: "#9C746A"),
      ProductColor(name: "Hthr Grey", color: "#886F70"),
    ],
    brand: "Super Ankle Boots",
    material: "Faux Sued, Velvet",
    category: "Women Shoes"
  ),
  Product(
    id: 4,
    name: "Backpack",
    sizes: ["15.6 in", "17 in"],
    price: 30.59,
    rating: 4.8,
    photos: [
      AppImages.backpackGrey,
      AppImages.backpackBlue,
      AppImages.backpackRed,
    ],
    colors: [
      ProductColor(name: "Grey", color: "#656565"),
      ProductColor(name: "Blue", color: "#454B61"),
      ProductColor(name: "Red", color: "#942833"),
    ],
    brand: "Arfico Bags",
    material: "100% Cotton",
    category: "Men Bags"
  ),
  Product(
    id: 5,
    name: "Scarf",
    sizes: ["1ft", "2ft", "3ft"],
    price: 7.99,
    rating: 4.8,
    photos: [
      AppImages.scarfGrey,
      AppImages.scarfBlue,
    ],
    colors: [
      ProductColor(name: "Grey", color: "#9C979D"),
      ProductColor(name: "Blue", color: "#3C4B52"),
    ],
    brand: "Saha Lanta",
    material: "Wool",
    category: "Women Accessories"
  ),
];
