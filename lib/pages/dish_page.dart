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
                    dish.sideViewImage != null
                        ? dish.mainImage
                        : dish.mainImage,
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
                SizedBox(height: 16.0),
                // Description
                _buildParagraph(
                  context: context,
                  descriptionWidth: _descriptionWidth,
                  title: "Descripción del plato",
                  text: dish.description,
                ),
                // History
                dish.history != null
                    ? _buildParagraph(
                        context: context,
                        descriptionWidth: _descriptionWidth,
                        title: "Un poco de historia",
                        text: dish.history,
                      )
                    : Container(),
                // How to eat
                dish.howToEat != null
                    ? _buildParagraph(
                        context: context,
                        descriptionWidth: _descriptionWidth,
                        title: "Como comer",
                        text: dish.howToEat)
                    : Container(),
                SizedBox(height: 16.0),
                _buildDishIngredients(context, _descriptionWidth),
                SizedBox(height: 24.0),
                _buildPrice(context),
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

  Widget _buildParagraph(
          {@required BuildContext context,
          @required double descriptionWidth,
          @required String title,
          @required String text}) =>
      Center(
        child: Column(
          children: [
            Container(
              width: descriptionWidth,
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            SizedBox(height: 16.0),
            Center(
              child: Container(
                width: descriptionWidth,
                child: Text(
                  text,
                  softWrap: true,
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ],
        ),
      );

  Widget _buildDishIngredients(BuildContext context, double descriptionWidth) {
    if (dish.ingredients.isNotEmpty) {
      List<Widget> children = [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Ingredientes",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        SizedBox(height: 16.0),
      ];

      children.addAll(
        dish.ingredients.map(
          (ingredient) => ingredient.allergens != null
              ? ListTile(
                  title: Text(
                    ingredient.name,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  subtitle: Text(
                    "Alergenos: ${ingredient.allergens.join(", ")}",
                    style: TextStyle(color: Colors.red[900]),
                  ),
                )
              : ListTile(
                  title: Text(
                    ingredient.name,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
        ),
      );

      return Center(
        child: Container(
          width: descriptionWidth,
          child: Column(
            children: children,
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _buildPrice(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "${dish.priceAsString}€",
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(width: 16.0),
          Text(
            dish.isSoldInUnits ? "Por unidad" : "",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      );

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
