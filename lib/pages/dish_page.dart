import 'dart:ui';

import 'package:first_deewi_mvp/models/dish_model.dart';
import 'package:first_deewi_mvp/stores/cart.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class DishPage extends StatelessWidget {
  final Dish dish;

  const DishPage({
    Key key,
    @required this.dish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _descriptionWidth = 512.0;

    // PHONE
    if (_screenWidth <= 768.0) _descriptionWidth = _screenWidth - 64.0;

    return Container(
      constraints: BoxConstraints(maxWidth: 768.0),
      child: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            expandedHeight: 304.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("${dish.name}"),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    dish.imagePath,
                    fit: BoxFit.cover,
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, 0.5),
                        end: Alignment(0.0, 0.0),
                        colors: <Color>[
                          Color(0x60000000),
                          Color(0x00000000),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Center(
                  child: Container(
                    width: _descriptionWidth,
                    margin: EdgeInsets.symmetric(
                      vertical: 24.0,
                    ),
                    child: Text(
                      dish.description,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "${dish.priceAsString}€",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                Center(
                  child: _buildAddToCartButton(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddToCartButton(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Material(
          child: InkWell(
            onTap: () {
              ReactiveModel<Cart> rmCart = Injector.getAsReactive<Cart>();

              rmCart.setState((cart) => cart.addDishToCart(dish));

              Navigator.pop(context);

              Fluttertoast.showToast(
                msg: "Plato añadido al carrito",
                webPosition: "center",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 2,
                textColor: Colors.white,
                fontSize: 22.0,
              );
            },
            child: Ink(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40.0),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.add_shopping_cart,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    "Añadir al carrito",
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
