import 'dart:ui';

import 'package:first_deewi_mvp/models/dish_model.dart';
import 'package:first_deewi_mvp/stores/cart.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class ItemTile extends StatelessWidget {
  final Dish dish;
  final int units;
  final bool isModifyable;

  const ItemTile({
    Key key,
    @required this.dish,
    @required this.units,
    this.isModifyable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(-3, 3),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80.0,
              width: 80.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: AssetImage(dish.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "${dish.name}",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  Text(
                    "${dish.priceAsString}€",
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ),
            _buildUnitCounter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildUnitCounter(BuildContext context) => isModifyable
      ? Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: StateBuilder<Cart>(
              observe: () => Injector.getAsReactive<Cart>(),
              builder: (context, rmCart) => Row(
                children: [
                  Material(
                    elevation: 3,
                    shape: CircleBorder(),
                    child: InkWell(
                      onTap: () =>
                          rmCart.setState((cart) => cart.addDishToCart(dish)),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Ink(
                          child: Icon(
                            Icons.add,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("$units"),
                  ),
                  Material(
                    elevation: 3,
                    shape: CircleBorder(),
                    child: InkWell(
                      onTap: () => rmCart
                          .setState((cart) => cart.removeDishFromCart(dish)),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Ink(
                          child: Icon(
                            Icons.remove,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      : Align(
          alignment: Alignment.bottomRight,
          child: Text(
            "ud${units > 1 ? "s" : ""}: $units",
            style: Theme.of(context).textTheme.caption,
          ),
        );
}
