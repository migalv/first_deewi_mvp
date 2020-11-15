import 'package:first_deewi_mvp/models/cuisine_model.dart';
import 'package:first_deewi_mvp/models/dish_model.dart';
import 'package:first_deewi_mvp/pages/cart_page.dart';
import 'package:first_deewi_mvp/pages/home_page.dart';
import 'package:first_deewi_mvp/widgets/cart_button.dart';
import 'package:first_deewi_mvp/widgets/cart_fab.dart';
import 'package:first_deewi_mvp/widgets/dish_card.dart';
import 'package:flutter/material.dart';

class CuisinePage extends StatefulWidget {
  final List<Dish> dishes;
  final Cuisine cuisine;

  const CuisinePage({Key key, @required this.cuisine, @required this.dishes})
      : super(key: key);

  @override
  _CuisinePageState createState() => _CuisinePageState();
}

class _CuisinePageState extends State<CuisinePage> {
  double _screenWidth;
  double _screenHeight;

  bool _isPhone;

  double _bannerHeight;

  double _lateralPadding;

  double _bottomPadding;

  int _itemCount;

  TextStyle _titleTextStyle;

  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    _screenHeight = MediaQuery.of(context).size.height;
    _bannerHeight = _screenHeight * 0.3;
    _itemCount = 3;
    _isPhone = false;
    _titleTextStyle = Theme.of(context).textTheme.headline1.copyWith(
          color: Colors.white.withOpacity(0.8),
        );

    // WEB
    if (_screenWidth >= 1024) {
      _lateralPadding = 128.0;
      _bottomPadding = 32.0;
    }
    // TABLET
    else if (_screenWidth < 1024.0 && _screenWidth >= 768.0) {
      _lateralPadding = 104.0;
      _bottomPadding = 32.0;
      _itemCount = 2;
    }
    // PHONE
    else if (_screenWidth < 768.0) {
      _isPhone = true;
      _lateralPadding = 32.0;
      _bottomPadding = 32.0;
      _itemCount = 2;
    }

    // Item count
    if (_screenWidth <= 450) _itemCount = 1;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            widget.cuisine.imagePath,
            width: _screenWidth,
            height: _screenHeight,
            fit: BoxFit.cover,
          ),
          _buildLogo(),
          _buildTitle(),
          _buildListView(),
          CartPage(),
          CartButton(),
        ],
      ),
      floatingActionButton: CartFAB(),
    );
  }

  Widget _buildLogo() => Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.only(
            top: _isPhone ? 0.0 : 24.0,
            left: _isPhone ? 0.0 : 24.0,
          ),
          child: InkWell(
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => HomePage()),
            ),
            child: Ink(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Hero(
                  tag: 'logo',
                  child: Image.asset(
                    "assets/images/logo.png",
                    scale: 6.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  Widget _buildTitle() => Container(
        height: _bannerHeight,
        width: _screenWidth,
        padding: EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: _isPhone ? _lateralPadding + 16.0 : 0.0,
        ),
        child: _isPhone
            ? Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 256.0,
                  ),
                  child: FittedBox(
                    child: Hero(
                      tag: 'cuisine-${widget.cuisine.name}',
                      child: Text(
                        "${widget.cuisine.name}",
                        style: _titleTextStyle,
                      ),
                    ),
                  ),
                ),
              )
            : Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 32.0,
                    left: 182.0,
                  ),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Hero(
                      tag: 'cuisine-${widget.cuisine.name}',
                      child: Text(
                        "${widget.cuisine.name}",
                        style: _titleTextStyle,
                      ),
                    ),
                  ),
                ),
              ),
      );

  Widget _buildListView() => Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 1024.0),
          margin: EdgeInsets.only(
            top: _bannerHeight,
            bottom: _bottomPadding,
            left: _lateralPadding,
            right: _lateralPadding,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                color: Colors.black45,
                spreadRadius: 3,
                offset: Offset(0.0, 0.0),
              ),
            ],
          ),
          child: GridView.count(
            padding: const EdgeInsets.all(16.0),
            crossAxisCount: _itemCount,
            childAspectRatio: 1,
            children:
                widget.dishes.map((dish) => DishCard(dish: dish)).toList(),
          ),
        ),
      );
}
