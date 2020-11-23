import 'package:first_deewi_mvp/models/dish_model.dart';
import 'package:meta/meta.dart';

class Cuisine {
  final String name;
  final List<Dish> dishes;
  final String imagePath;

  Cuisine({
    @required this.name,
    @required this.dishes,
    @required this.imagePath,
  });

  Map<String, dynamic> toJson() => {
        "cuisine_name": this.name,
        "dishes": dishes.map((dish) => dish.toJson()).toList(),
        "image_path": this.imagePath,
      };
}
