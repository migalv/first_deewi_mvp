import 'package:first_deewi_mvp/data.dart' as data;
import 'package:first_deewi_mvp/widgets/cart_button.dart';
import 'package:first_deewi_mvp/widgets/cart_fab.dart';
import 'package:first_deewi_mvp/widgets/cuisine_card.dart';
import 'package:flutter/material.dart';

class CuisinesListPage extends StatefulWidget {
  // Screen types
  @override
  _CuisinesListPageState createState() => _CuisinesListPageState();
}

class _CuisinesListPageState extends State<CuisinesListPage> {
  bool _isTablet;

  double _screenWidth;
  double _screenHeight;

  double _horizontalPadding;
  double _verticalPadding;
  double _lateralPadding;

  TextStyle _titleTextStyle;

  CrossAxisAlignment _crossAxisAlignment;

  int _cardsPerRow;

  double _bannerHeight;

  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    _screenHeight = MediaQuery.of(context).size.height;

    // Number of cuisines cards per row in the Grid View
    _cardsPerRow = 3;

    _isTablet = false;

    _bannerHeight = _screenHeight * 0.4;

    // Paddings
    _horizontalPadding = 32.0;
    _verticalPadding = 24.0;

    // TextStyles
    _titleTextStyle = Theme.of(context).textTheme.headline4;

    // Alignments
    _crossAxisAlignment = CrossAxisAlignment.start;
    _lateralPadding = 64.0;

    if (_screenWidth < 1100 && _screenWidth >= 560) {
      _cardsPerRow = 2;
    } else if (_screenWidth < 560) {
      _cardsPerRow = 1;
      _titleTextStyle =
          Theme.of(context).textTheme.headline4.copyWith(fontSize: 24.0);
      _crossAxisAlignment = CrossAxisAlignment.center;
    }

    // Tablet
    if (_screenWidth <= 768) {
      _lateralPadding = 32.0;
      _isTablet = true;
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              "assets/images/home_banner.png",
              width: _screenWidth,
              height: _screenHeight,
              fit: BoxFit.cover,
            ),
            _buildLogo(),
            CartButton(),
            ListView(
              shrinkWrap: true,
              primary: true,
              children: [
                SizedBox(height: _bannerHeight),
                _buildCuisineList(),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: CartFAB(),
    );
  }

  Widget _buildLogo() => Align(
        alignment: _isTablet ? Alignment.topCenter : Alignment.topLeft,
        child: Padding(
          padding: _isTablet
              ? EdgeInsets.all(64.0)
              : EdgeInsets.only(top: 64.0, left: 64.0),
          child: Hero(
            tag: 'logo',
            child: Image.asset(
              "assets/images/logo.png",
              scale: 2,
            ),
          ),
        ),
      );

  Widget _buildCuisineList() => Container(
        margin: EdgeInsets.symmetric(horizontal: _lateralPadding),
        constraints: BoxConstraints(
          minHeight: _screenHeight - _bannerHeight,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(32.0),
            topLeft: Radius.circular(32.0),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              color: Colors.black45,
              spreadRadius: 3,
              offset: Offset(0.0, 0.0),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: _verticalPadding,
            horizontal: _horizontalPadding,
          ),
          child: Column(
            crossAxisAlignment: _crossAxisAlignment,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  "Choose your favorite cuisine",
                  style: _titleTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              GridView.count(
                crossAxisCount: _cardsPerRow,
                childAspectRatio: 4 / 3,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: data.cuisines
                    .map((cuisine) => CuisineCard(cuisine: cuisine))
                    .toList(),
              ),
            ],
          ),
        ),
      );
}
