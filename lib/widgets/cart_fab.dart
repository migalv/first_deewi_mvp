import 'package:first_deewi_mvp/pages/cart_page.dart';
import 'package:flutter/material.dart';

class CartFAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    bool _isPhone = false;
    bool _isTablet = false;
    if (_screenWidth < 1024.0) _isTablet = true;
    if (_screenWidth < 768.0) _isPhone = true;

    return _isPhone || _isTablet
        ? FloatingActionButton(
            backgroundColor: Colors.amber,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPage()),
            ),
            child: Icon(
              Icons.shopping_cart,
              size: 32.0,
              color: Colors.white,
            ),
          )
        : Container();
  }
}
