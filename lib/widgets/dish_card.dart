import 'package:first_deewi_mvp/models/dish_model.dart';
import 'package:first_deewi_mvp/pages/dish_page.dart';
import 'package:flutter/material.dart';

class DishCard extends StatelessWidget {
  final Dish dish;

  const DishCard({
    Key key,
    @required this.dish,
  }) : super(key: key);

  final double _borderRadius = 8.0;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(_borderRadius),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(_borderRadius),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DishPage(dish: dish),
            ),
          ),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(_borderRadius),
              image: DecorationImage(
                image: AssetImage(dish.imagePath),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: Offset(-3, 3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
