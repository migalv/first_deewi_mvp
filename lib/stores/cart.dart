import 'package:first_deewi_mvp/models/dish_model.dart';

class Cart {
  Map<Dish, int> _dishes;
  Map<Dish, int> get dishes => _dishes;
  bool _isCartVisible;
  bool get isCartVisible => _isCartVisible;

  Cart({Map<Dish, int> dishes, isCartVisible = false})
      : _dishes = dishes ?? {},
        _isCartVisible = isCartVisible;

  void addDishToCart(Dish dish) {
    if (_dishes.containsKey(dish))
      _dishes[dish] += 1;
    else
      _dishes[dish] = 1;
  }

  void removeDishFromCart(Dish dish) {
    if (_dishes.containsKey(dish)) {
      _dishes[dish] -= 1;
      if (_dishes[dish] <= 0) _dishes.remove(dish);
    }
  }

  void toggleCartVisibility() => _isCartVisible = !_isCartVisible;

  void clear() {
    _dishes.clear();
  }

  double get totalPrice {
    double total = 0;

    _dishes.forEach((dish, units) => total += dish.price * units);

    return total;
  }

  String get totalPriceString =>
      totalPrice.toStringAsFixed(2).replaceAll(".", ",");
}
