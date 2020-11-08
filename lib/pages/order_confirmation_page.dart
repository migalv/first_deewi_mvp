import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_deewi_mvp/dialogs/time_selection_dialog.dart';
import 'package:first_deewi_mvp/js/location.dart';
import 'package:first_deewi_mvp/pages/cuisines_list_page.dart';
import 'package:first_deewi_mvp/stores/cart.dart';
import 'package:first_deewi_mvp/widgets/item_tile.dart';
import 'package:flutter/material.dart';
import 'package:js/js.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import "dart:math";

class OrderConfirmationPage extends StatefulWidget {
  final String orderTime;

  OrderConfirmationPage({Key key, @required this.orderTime}) : super(key: key);

  @override
  _OrderConfirmationPageState createState() =>
      _OrderConfirmationPageState(orderTime);
}

class _OrderConfirmationPageState extends State<OrderConfirmationPage> {
  final _formKey = GlobalKey<FormState>();

  final _maskFormatter = MaskTextInputFormatter(
    mask: '### ## ## ##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _addressController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  bool _isLoading = false;

  String _orderTime;

  GeolocationPosition _userLocation;

  _OrderConfirmationPageState(orderTime) : _orderTime = orderTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirm order"),
      ),
      body: ListView(
        children: [
          _buildOrderDetails(context),
          _buildForm(),
          Center(
            child: RaisedButton(
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  getCurrentPosition(allowInterop((pos) => success(pos)));

                  if (_userLocation != null)
                    _sendOrderDetails();
                  else
                    await showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text("Activate location"),
                        content: Text(
                          "Please activate location permissions to continue.",
                        ),
                        actions: [
                          RaisedButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("OK"),
                          )
                        ],
                      ),
                    );
                }
              },
              child: _isLoading
                  ? CircularProgressIndicator()
                  : Text("Confirm order"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() => Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Name",
                ),
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value.isEmpty) return 'Please enter a name';
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: "Phone",
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  _maskFormatter,
                ],
                validator: (value) {
                  if (value.isEmpty) return 'Please enter a phone';
                  if (_maskFormatter.getUnmaskedText().length < 9)
                    return 'Please enter a valid phone';
                  return null;
                },
              ),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: "Delivery address",
                ),
                keyboardType: TextInputType.streetAddress,
                validator: (value) {
                  if (value.isEmpty) return 'Please enter an address';
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value.isEmpty) return 'Please enter an email';
                  final regExp = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
                  if (!regExp.hasMatch(value))
                    return 'Please enter a valid email';

                  return null;
                },
              ),
            ],
          ),
        ),
      );

  Widget _buildOrderDetails(BuildContext context) => StateBuilder<Cart>(
      observe: () => Injector.getAsReactive<Cart>(),
      builder: (_, rmCart) {
        Cart cart = rmCart.state;
        List<Widget> children = [
          Text(
            "Order details",
            style: Theme.of(context).textTheme.headline4,
          ),
        ];

        children.addAll(cart.dishes.map(
          (dish) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ItemTile(
              dish: dish,
              isModifyable: false,
            ),
          ),
        ));

        children.add(
          Text(
            "Total price: ${cart.totalPriceString}€",
            style: Theme.of(context).textTheme.headline6,
          ),
        );

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: children,
          ),
        );
      });

  double _calculateDistanceInMeters(lat1, lon1, lat2, lon2) {
    var r = 6371e3; // metres
    var phi1 = lat1 * pi / 180; // φ, λ in radians
    var phi2 = lat2 * pi / 180;
    var delta1 = (lat2 - lat1) * pi / 180;
    var deltaLambda = (lon2 - lon1) * pi / 180;

    var a = sin(delta1 / 2) * sin(delta1 / 2) +
        cos(phi1) * cos(phi2) * sin(deltaLambda / 2) * sin(deltaLambda / 2);
    var c = 2 * atan2(sqrt(a), sqrt(1 - a));

    var d = r * c;

    return d;
  }

  Future<void> _sendOrderDetails() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    ReactiveModel<Cart> rmCart = Injector.getAsReactive<Cart>();
    setState(() => _isLoading = true);

    Response response = await _firestore.runTransaction((transaction) async {
      DocumentSnapshot scheduleDoc =
          await _firestore.collection("agenda").doc("delivery_schedule").get();

      double userLat = _userLocation.coords.latitude;
      double userLon = _userLocation.coords.longitude;
      double centerLat = scheduleDoc.data()["center_coords"]["lat"];
      double centerLon = scheduleDoc.data()["center_coords"]["lon"];
      double maxDistance = scheduleDoc.data()["max_meters"];

      double distance =
          _calculateDistanceInMeters(userLat, userLon, centerLat, centerLon);

      print("Distance: $distance");
      print("CenterLat: $centerLat");
      print("CenterLon: $centerLon");
      print("UserLat: $userLat");
      print("UserLon: $userLon");

      if (distance > maxDistance) return Response.NOT_IN_BOUNDS;

      Map<String, bool> availableTimes =
          Map<String, bool>.from(scheduleDoc.data()['available_times']);

      if (availableTimes[_orderTime]) {
        _firestore.collection("orders").doc().set(
          {
            "items": rmCart.state.dishes.map((dish) => dish.toJson()).toList(),
            "created_at": DateTime.now().millisecondsSinceEpoch,
            "delivery_time": _orderTime,
            "client_address": _addressController.text,
            "client_name": _nameController.text,
            "client_email": _emailController.text,
            "client_phone": _phoneController.text,
            "total_price": rmCart.state.totalPrice,
          },
        );

        availableTimes[_orderTime] = false;

        _firestore.collection("agenda").doc("delivery_schedule").update(
          {"available_times": availableTimes},
        );

        return Response.SUCCESS;
      } else {
        return Response.NOT_AVAILABLE;
      }
    });

    setState(() => _isLoading = false);

    switch (response) {
      case Response.SUCCESS:
        await showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text("Order confirmed"),
                content: Text("You will recieve the order at $_orderTime"),
                actions: [
                  RaisedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Dismiss"),
                  )
                ],
              );
            });
        rmCart.setState((cart) => cart.clear());

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => CuisinesListPage(),
          ),
        );
        break;
      case Response.NOT_AVAILABLE:
        String selectedTime = await showDialog(
          context: context,
          builder: (_) {
            return TimeSelectionDialog(
              errorText:
                  "The time you selected has been booked. Please select a new one.",
            );
          },
        );

        setState(() => _orderTime = selectedTime);

        break;
      case Response.NOT_IN_BOUNDS:
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text("Not in bounds"),
                content: Text("Sorry we can't deliver there yet."),
                actions: [
                  RaisedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Dismiss"),
                  )
                ],
              );
            });
        break;
      default:
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text("Unknown error"),
                content: Text("An unknown error ocurred."),
                actions: [
                  RaisedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Dismiss"),
                  )
                ],
              );
            });
        break;
    }
  }

  success(pos) => setState(() => _userLocation = pos);
}

enum Response {
  SUCCESS,
  NOT_AVAILABLE,
  NOT_IN_BOUNDS,
}
