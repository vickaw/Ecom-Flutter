import '../utils/utils.dart';

class Category {
  int id;
  String name, photo;
  String color;
  List<SubCategory> subCategories;

  Category({this.id, this.name, this.color, this.photo, this.subCategories});
}

class SubCategory {
  String name;
  List<String> sub;

  SubCategory({this.name, this.sub});
}

List<Category> categories = [
  Category(
    id: 1,
    name: "Skin Food",
    color: "#FF7351",
    photo: AppImages.skinfood,
    subCategories: [
      SubCategory(
        name: "Mobile Phones",
        sub: ["Smart Phones", "Android Phones", "iOS Phones", "Basic Phones"],
      ),
      SubCategory(
        name: "Mobile Accessories",
        sub: ["Phone Cases", "Screen Protectors", "Memory Cards", "Batteries", "Power Banks", "Headsets"],
      ),
      SubCategory(
        name: "Tablets",
        sub: ["Tablets", "Tablet Accessories"],
      ),
    ],
  ),
  Category(
    id: 2,
    name: "Skin Care",
    color: "#60B8FD",
    photo: AppImages.skincare,
    subCategories: [
      SubCategory(
        name: "Home Audio",
        sub: ["Speakers", "Bluetooth Speakers", "Home Theatre Systems"],
      ),
      SubCategory(
        name: "Televisions",
        sub: ["LCD", "LED"],
      ),
      SubCategory(
        name: "Cameras",
        sub: ["VR", "Videos", "Surveillance"],
      ),
      
    ],
  ),
  Category(
    id: 3,
    name: "Perfumes",
    color: "#3AC341",
    photo: AppImages.perfume,
    subCategories: [
      SubCategory(
        name: "Computer Accessories",
        sub: ["Key Board & Mice", "UPS", "Printers", "Hard Drives", "Monitors"],
      ),
      SubCategory(
        name: "Laptops",
        sub: ["HP", "DELL", "MAC", "Lenovo", "Acer"],
      ),
    ],
  ),
  Category(
    id: 4,
    name: "Accessories",
    color: "#EC3B7F",
    photo: AppImages.accessory,
    subCategories: [
      SubCategory(
        name: "Women's Fashion",
        sub: ["Shoes", "Accessories", "Jewelry", "Shirts", "Bags", "Underwear"],
      ),
      SubCategory(
        name: "Men's Fashion",
        sub: ["Shoes", "Accessories", "Jewelry", "Shirts", "Bags", "Underwear"],
      ),
      SubCategory(
        name: "Fashion Accessories",
        sub: ["Watches", "Loggages"],
      ),
    ],
  ),
  Category(
    id: 5,
    name: "Other",
    color: "#C1C6F9",
    photo: AppImages.other,
    subCategories: [
      SubCategory(
        name: "Home & Kitchen",
        sub: ["Furniture", "Home Decor", "Bedding", "Bath"],
      ),
      SubCategory(
        name: "Refrigirators",
        sub: ["Refrigirators"],
      ),
      SubCategory(
        name: "Tools & Equipments",
        sub: ["Hardware", "Safety & Security"],
      ),
    ],
  ),
  Category(
    id: 6,
    name: "Beauty",
    color: "#C9C9C9",
    photo: AppImages.mascara,
    subCategories: [
      SubCategory(
        name: "Perfumes",
        sub: ["Women Perfumes", "Men Perfumes"],
      )
    ],
  ),
  Category(
    id: 7,
    name: "Gaming",
    color: "#E5D9C1",
    photo: AppImages.controller,
    subCategories: [
      SubCategory(
        name: "Playstation 4",
        sub: ["Consoles", "Games"],
      ),
      SubCategory(
        name: "Playstation 3",
        sub: ["Consoles", "Games"],
      ),
      SubCategory(
        name: "XBOX One",
        sub: ["Consoles", "Games"],
      ),
      SubCategory(
        name: "XBOX 360",
        sub: ["Consoles", "Games"],
      ),
      SubCategory(
        name: "Nintendo Switch",
        sub: ["Consoles", "Games"],
      ),
    ],
  ),
];
