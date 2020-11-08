import 'package:first_deewi_mvp/models/dish_model.dart';

class Cart {
  List<Dish> _dishes;
  List<Dish> get dishes => _dishes;

  Cart({List<Dish> dishes}) : _dishes = dishes ?? [];

  void addDishToCart(Dish dish) => _dishes.add(dish);
  void removeDishFromCart(Dish dish) => _dishes.remove(dish);

  void clear() {
    _dishes.clear();
  }

  double get totalPrice {
    double total = 0;

    total =
        _dishes.fold(0, (previousValue, dish) => previousValue += dish.price);

    return total;
  }

  String get totalPriceString {
    double total = 0;

    total =
        _dishes.fold(0, (previousValue, dish) => previousValue += dish.price);

    return total.toStringAsFixed(2).replaceAll(".", ",");
  }
}
