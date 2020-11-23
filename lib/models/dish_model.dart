import 'package:first_deewi_mvp/models/ingredient.dart';
import 'package:meta/meta.dart';

class Dish {
  /// Dish name
  final String _name;
  String get name => _name;

  /// How the dish is made
  final String _description;
  String get description => _description;

  /// A little bit of history around the dish
  final String _history;
  String get history => _history;

  // A brief explanation on how to eat the dish
  final String _howToEat;
  String get howToEat => _howToEat;

  /// The ingredients of the dish
  final List<Ingredient> _ingredients;
  List<Ingredient> get ingredients => _ingredients;

  /// If the dish is sold in units
  final bool _isSoldInUnits;
  bool get isSoldInUnits => _isSoldInUnits;

  /// The price of the dish
  final double _price;
  double get price => _price;
  String get priceAsString => _price.toStringAsFixed(2).replaceAll(".", ",");

  /// The path to the default image of the dish
  final String _mainImage;
  String get mainImage => _mainImage;

  /// The path to an image of the dish from a side view perspective
  final String _sideViewImage;
  String get sideViewImage => _sideViewImage;

  Dish({
    @required String name,
    @required String description,
    @required double price,
    @required String mainImage,
    @required List<Ingredient> ingredients,
    bool isSoldInUnits = false,
    String sideViewImage,
    String history,
    String howToEat,
  })  : _name = name,
        _price = price,
        _isSoldInUnits = isSoldInUnits,
        _mainImage = mainImage,
        _sideViewImage = sideViewImage,
        _description = description,
        _ingredients = ingredients,
        _history = history,
        _howToEat = howToEat;

  Map<String, dynamic> toJson() => {
        "dish_name": _name,
        "dish_price": _price,
        "description": _description,
        "history": _history,
        "ingredients": _ingredients,
        "image_path": _mainImage,
      };

  @override
  bool operator ==(Object other) {
    return other is Dish ? other._name == this.name : false;
  }

  @override
  int get hashCode => name.hashCode;
}
