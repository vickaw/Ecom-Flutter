import 'dart:convert';

import '../models/cart_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartService {
  final String _cartItems = "cartItemsDb";

  Future<List<CartItem>> getCartItems() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var cartItemsStringList = prefs.getStringList(_cartItems);

    List<CartItem> emptyList = [];

    List<CartItem> cartItems = cartItemsStringList == null
        ? emptyList
        : cartItemsStringList.map((item) {
            return CartItem.fromJson(jsonDecode(item));
          }).toList();

    return cartItems;
  }

  Future<bool> setCartItem(Map cartItem) async {
    // Get Current Cart Items
    List<CartItem> cartItems = await getCartItems();

    if (cartItems.isEmpty || cartItems.length == 0) {
      // Add new Item
      cartItems.add(CartItem.fromJson(cartItem));
    } else {
      var item = cartItems.firstWhere(
        (item) => item.name == cartItem['name'],
        orElse: () => null,
      );

      if (item != null) {
        item.number += 1;
      } else {
        // Add new Item
        cartItems.add(CartItem.fromJson(cartItem));
      }
    }

    return save(cartItems);
  }

  Future<bool> save(List<CartItem> cartItems) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Convert to StringList
    List<String> cartItemsStringList = cartItems.map((item) {
      return json.encode(item).toString();
    }).toList();

    return prefs.setStringList(_cartItems, cartItemsStringList);
  }

  Future<bool> removeItemFromCart(int id) async {
    // Get Current Cart Items
    List<CartItem> cartItems = await getCartItems();
    cartItems.removeWhere((item) => item.id == id);

    return save(cartItems);
  }

  Future<bool> reduce(int id) async {
    // Get Current Cart Items
    List<CartItem> cartItems = await getCartItems();

    final item = cartItems.firstWhere(
      (item) => item.id == id,
      orElse: null,
    );
    if (item != null) {
      if (item.number >= 2) {
        item.number -= 1;
      }
    }

    return save(cartItems);
  }

  Future<bool> add(int id) async {
    // Get Current Cart Items
    List<CartItem> cartItems = await getCartItems();

    final item = cartItems.firstWhere(
      (item) => item.id == id,
      orElse: null,
    );
    item.number += 1;

    return save(cartItems);
  }

  Future<double> sum() async {
    // Get Current Cart Items
    double tp = 0;
    List<CartItem> cartItems = await getCartItems();
    cartItems.forEach((product) {
      tp += (product.price * product.number);
    });
    return tp;
  }
}
