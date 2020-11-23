import 'package:meta/meta.dart';

class Ingredient {
  final String name;
  final List<Ingredient> ingredients;
  final List<String> allergens;

  Ingredient({
    @required this.name,
    this.ingredients,
    this.allergens,
  });
}
