import 'package:meta/meta.dart';

class Dish {
  final String _name;
  String get name => _name;
  final String _description;
  String get description => _description;
  final double _price;
  double get price => _price;
  String get priceAsString => _price.toStringAsFixed(2).replaceAll(".", ",");
  final String _imagePath;
  String get imagePath => _imagePath;

  Dish(
      {@required name,
      @required description,
      @required price,
      @required imagePath})
      : _name = name,
        _price = price,
        _imagePath = imagePath,
        _description = description;

  Map<String, dynamic> toJson() => {
        "name": _name,
        "price": _price,
      };

  @override
  bool operator ==(Object other) {
    return other is Dish ? other._name == this.name : false;
  }

  @override
  int get hashCode => name.hashCode;
}
