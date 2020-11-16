import 'package:first_deewi_mvp/models/cuisine_model.dart';
import 'package:first_deewi_mvp/pages/cuisine_page.dart';
import 'package:flutter/material.dart';

class CuisineCard extends StatelessWidget {
  final Cuisine cuisine;
  const CuisineCard({Key key, @required this.cuisine}) : super(key: key);

  final double _borderRadius = 16.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(_borderRadius),
        elevation: 3,
        child: InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CuisinePage(
                cuisine: cuisine,
                dishes: cuisine.dishes,
              ),
            ),
          ),
          // borderRadius: BorderRadius.circular(_borderRadius),
          child: Stack(
            children: [
              Ink(
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(_borderRadius),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(-3, 3),
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage(cuisine.imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.only(
                          // bottomLeft: Radius.circular(_borderRadius),
                          // bottomRight: Radius.circular(_borderRadius),
                          ),
                    ),
                    child: Center(
                      child: Hero(
                        tag: 'cuisine-${cuisine.name}',
                        child: Text(
                          cuisine.name,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
