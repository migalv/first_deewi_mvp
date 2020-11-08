import 'package:first_deewi_mvp/models/dish_model.dart';
import 'package:first_deewi_mvp/stores/cart.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class DishPage extends StatelessWidget {
  final Dish dish;

  const DishPage({
    Key key,
    @required this.dish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              actions: [],
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  dish.name,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
                background: Image(
                  image: AssetImage(dish.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Price: ${dish.priceAsString}€",
                  style: TextStyle(fontSize: 32.0),
                ),
              ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: StateBuilder<Cart>(
                    observe: () => Injector.getAsReactive<Cart>(),
                    builder: (context, rmCart) {
                      return InkWell(
                        onTap: () {
                          rmCart.setState((store) => store.addDishToCart(dish));
                          Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text("Dish added to cart")),
                          );
                        },
                        child: Ink(
                          width: 300.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Center(
                            child: Text(
                              "Add to cart",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 22.0),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
