import 'package:flutter/foundation.dart';
class CartModel extends ChangeNotifier {
  // Private lists to manage cart and favorite items
  final List<Map<String, dynamic>> _cartItems = [];
  final List<Map<String, dynamic>> _favorites = [];

  // Getters for cart and favorite items
  List<Map<String, dynamic>> get cartItems => List.unmodifiable(_cartItems);
  List<Map<String, dynamic>> get favorites => List.unmodifiable(_favorites);

  double get totalPrice => _cartItems.fold(
        0,
        (sum, item) => sum + item['totalPrice'],
      );

  // Add item to the cart
  void addToCart(String name, double totalPrice, int quantity, String image) {
    final index = _cartItems.indexWhere((item) => item['name'] == name);
    if (index != -1) {
      _cartItems[index]['quantity'] += quantity;
      _cartItems[index]['totalPrice'] =
          (_cartItems[index]['quantity'] * (totalPrice / quantity));
    } else {
      _cartItems.add({
        'name': name,
        'totalPrice': totalPrice,
        'quantity': quantity,
        'image': image,
      });
    }
    notifyListeners();
  }

  // Update item quantity
  void updateQuantity(int index, int newQuantity) {
    if (index >= 0 && index < _cartItems.length) {
      if (newQuantity > 0) {
        final unitPrice =
            _cartItems[index]['totalPrice'] / _cartItems[index]['quantity'];
        _cartItems[index]['quantity'] = newQuantity;
        _cartItems[index]['totalPrice'] = unitPrice * newQuantity;
      } else {
        removeItem(index); // Remove item if quantity becomes 0
      }
      notifyListeners();
    }
  }

  // Remove item from the cart by index
  void removeItem(int index) {
    if (index >= 0 && index < _cartItems.length) {
      _cartItems.removeAt(index);
      notifyListeners();
    }
  }

  // Clear all items from the cart
  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  // Add item to the favorites list
  void addToFavorites(
      String name, String price, String image, String description, int rating) {
    final exists = _favorites.any((item) => item['name'] == name);
    if (!exists) {
      _favorites.add({
        'name': name,
        'price': price,
        'image': image,
        'description': description,
        'rating': rating,
      });
      notifyListeners();
    }
  }

  // Remove item from the favorites list by name
  void removeFromFavorites(String name) {
    _favorites.removeWhere((item) => item['name'] == name);
    notifyListeners();
  }

  // Clear all items from the favorites
  void clearFavorites() {
    _favorites.clear();
    notifyListeners();
  }

  // Check if an item is in the favorites
  bool isFavorite(String name) {
    return _favorites.any((item) => item['name'] == name);
  }
}