import 'package:first_deewi_mvp/pages/cart_page.dart';
import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    bool _isPhone = false;
    bool _isTablet = false;
    if (_screenWidth < 1024.0) _isTablet = true;
    if (_screenWidth < 768.0) _isPhone = true;

    return _isPhone || _isTablet
        ? Container()
        : Positioned(
            top: -32.0,
            right: -32.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.amber,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 40.0,
                  top: 40.0,
                  left: 16.0,
                  bottom: 16.0,
                ),
                child: IconButton(
                  iconSize: 32.0,
                  color: Colors.white,
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage()),
                  ),
                  icon: Icon(Icons.shopping_cart),
                ),
              ),
            ),
          );
  }
}
