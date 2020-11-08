import 'package:meta/meta.dart';

class Dish {
  final String _name;
  String get name => _name;
  final double _price;
  double get price => _price;
  String get priceAsString => _price.toStringAsFixed(2).replaceAll(".", ",");
  final String _imagePath;
  String get imagePath => _imagePath;

  Dish({@required name, @required price, @required imagePath})
      : _name = name,
        _price = price,
        _imagePath = imagePath;

  Map<String, dynamic> toJson() => {
        "name": _name,
        "price": _price,
      };
}
