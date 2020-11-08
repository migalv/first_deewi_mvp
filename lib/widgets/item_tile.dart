import 'package:first_deewi_mvp/models/dish_model.dart';
import 'package:first_deewi_mvp/stores/cart.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class ItemTile extends StatelessWidget {
  final Dish dish;
  final bool isModifyable;

  const ItemTile({
    Key key,
    @required this.dish,
    this.isModifyable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
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
          ]),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(8.0),
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
          Expanded(child: Text("${dish.name}")),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Text("${dish.priceAsString}€"),
                isModifyable
                    ? StateBuilder<Cart>(
                        observe: () => Injector.getAsReactive<Cart>(),
                        builder: (context, rmCart) {
                          return IconButton(
                            onPressed: () => rmCart.setState(
                                (cart) => cart.removeDishFromCart(dish)),
                            icon: Icon(
                              Icons.delete,
                              size: 32.0,
                              color: Colors.black87,
                            ),
                          );
                        })
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
