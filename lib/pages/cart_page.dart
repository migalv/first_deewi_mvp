import 'package:first_deewi_mvp/dialogs/time_selection_dialog.dart';
import 'package:first_deewi_mvp/stores/cart.dart';
import 'package:first_deewi_mvp/widgets/item_tile.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
      body: SafeArea(
        child: StateBuilder<Cart>(
            observe: () => Injector.getAsReactive<Cart>(),
            builder: (context, rmCart) {
              return rmCart.state.dishes.isNotEmpty
                  ? Column(
                      children: [
                        Expanded(
                          child: ListView(
                            children: rmCart.state.dishes
                                .map((dish) => ItemTile(dish: dish))
                                .toList(),
                          ),
                        ),
                        Text(
                          "Total: ${rmCart.state.totalPriceString}€",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ],
                    )
                  : Center(
                      child: Text("No dishes added"),
                    );
            }),
      ),
      floatingActionButton: StateBuilder<Cart>(
          observe: () => Injector.getAsReactive<Cart>(),
          builder: (context, rmCart) {
            return rmCart.state.dishes.isNotEmpty
                ? FloatingActionButton.extended(
                    onPressed: () => showDialog(
                      context: context,
                      child: TimeSelectionDialog(),
                    ),
                    label: Text("Order"),
                    icon: Icon(Icons.shopping_cart),
                  )
                : Container();
          }),
    );
  }
}
