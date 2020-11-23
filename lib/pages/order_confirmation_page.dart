import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_deewi_mvp/dialogs/time_selection_dialog.dart';
import 'package:first_deewi_mvp/js/location.dart';
import 'package:first_deewi_mvp/pages/home_page.dart';
import 'package:first_deewi_mvp/stores/cart.dart';
import 'package:first_deewi_mvp/widgets/item_tile.dart';
import 'package:first_deewi_mvp/widgets/my_box_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:js/js.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:first_deewi_mvp/services/google_geocoding_service.dart';
import "dart:math";

class OrderConfirmationPage extends StatefulWidget {
  @override
  _OrderConfirmationPageState createState() => _OrderConfirmationPageState();
}

class _OrderConfirmationPageState extends State<OrderConfirmationPage> {
  String _orderTime;

  Map<String, bool> _availableTimes;

  final _formKey = GlobalKey<FormState>();

  GoogleGeocodingService _geocodingService;

  final _maskFormatter = MaskTextInputFormatter(
    mask: '### ## ## ##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _addressController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  bool _isTimeTableLoading;
  bool _isPaymentProcessing;

  String _deliveryDay = "Domingo 19";

  GeolocationPosition _userLocation;

  TextStyle _titleTextStyle;

  // Widget measures

  ////////////////////
  // MAIN CONTAINER
  /// max container width by default
  double _mainContainterWidth;
  double _mainContainerMaxWidth;
  double _mainContainerLateralMargin;
  double _mainContainerTopMargin;
  double _mainContainerHorizontalPadding;
  double _mainContainerVerticalPadding;

  double _columnSeparation;

  double _textFieldMaxWidth;

  double _timeTableHeight;

  double _leftContentLeftPadding;

  double _screenWidth;
  double _screenHeight;

  bool _isWeb;

  @override
  void initState() {
    _geocodingService = GoogleGeocodingService();
    _isTimeTableLoading = true;
    _isPaymentProcessing = false;
    getCurrentPosition(allowInterop((pos) => success(pos)));
    _loadDeliverySchedule()
        .then((_) => setState(() => _isTimeTableLoading = false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    _screenHeight = MediaQuery.of(context).size.height;

    _isWeb = true;

    _titleTextStyle = Theme.of(context).textTheme.headline4.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        );

    _mainContainerLateralMargin = 64.0;
    _mainContainerMaxWidth = 1024.0 - _mainContainerLateralMargin * 2;
    _mainContainerHorizontalPadding = 32.0;
    _mainContainterWidth = min(
      _screenWidth - _mainContainerLateralMargin * 2,
      _mainContainerMaxWidth,
    );

    _leftContentLeftPadding = 16.0;

    _columnSeparation = 16.0;

    _mainContainerTopMargin = 88.0;
    _mainContainerVerticalPadding = 24.0;

    _timeTableHeight = 164.0;

    _textFieldMaxWidth = _mainContainterWidth * 0.6 -
        _leftContentLeftPadding -
        _mainContainerHorizontalPadding -
        48.0;

    // TABLET
    if (_screenWidth < 1024 && _screenWidth >= 768.0) {
      _isWeb = false;
      _mainContainerMaxWidth = 768.0;
      _mainContainterWidth = min(
        _screenWidth - _mainContainerLateralMargin * 2,
        _mainContainerMaxWidth,
      );
      _textFieldMaxWidth = double.infinity;
    }
    // PHONE
    else if (_screenWidth < 768.0) {
      _isWeb = false;
      _mainContainerMaxWidth = 768.0;
      _mainContainerLateralMargin = 32.0;
      _mainContainterWidth = null;
      _textFieldMaxWidth = double.infinity;
      if (_screenWidth <= 530) {
        _mainContainerLateralMargin = 0.0;
        _titleTextStyle = Theme.of(context).textTheme.headline5.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            );
      }
      if (_screenWidth < 425) _mainContainerHorizontalPadding = 16.0;
    }

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/home_banner.png",
            width: _screenWidth,
            height: _screenHeight,
            fit: BoxFit.cover,
          ),
          _buildLogo(),
          Center(child: _buildMainContainer()),
        ],
      ),
    );
  }

  Widget _buildLogo() => Align(
        alignment: Alignment.topLeft,
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
      );

  Widget _buildMainContainer() {
    double orderDetailsContainer;

    if (_isWeb) {
      orderDetailsContainer = (_mainContainterWidth -
              _mainContainerHorizontalPadding * 2 -
              _columnSeparation) *
          0.4;
    } else {
      orderDetailsContainer = 768 -
          _mainContainerHorizontalPadding * 2 -
          _mainContainerLateralMargin;
    }

    return SingleChildScrollView(
      child: Container(
        width: _mainContainterWidth,
        margin: EdgeInsets.fromLTRB(
          _mainContainerLateralMargin,
          _mainContainerTopMargin,
          _mainContainerLateralMargin,
          0.0,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: _mainContainerHorizontalPadding,
          vertical: _mainContainerVerticalPadding,
        ),
        constraints: BoxConstraints(
          maxWidth: _mainContainerMaxWidth,
          minHeight: _screenHeight - 64,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black87,
              spreadRadius: 1,
              blurRadius: 3,
            ),
          ],
        ),
        child: Form(
          key: _formKey,
          child: _isWeb
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLeftColumn(),
                    SizedBox(width: _columnSeparation),
                    _buildOrderDetailsContainer(
                        containerWidth: orderDetailsContainer),
                  ],
                )
              : Column(
                  children: [
                    _buildTitle(),
                    _buildMobileContent(),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildMobileContent() => Container(
        constraints: BoxConstraints(maxWidth: 768.0 / 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            _buildDeliveryTimeSection(),
            SizedBox(height: 16.0),
            _buildLocationSection(),
            _buildOrderDetailsContainer(),
            SizedBox(height: 16.0),
            _buildContactSection(),
          ],
        ),
      );

  Widget _buildLeftColumn() => Container(
        constraints: BoxConstraints(
          maxWidth: (_mainContainterWidth -
                  _mainContainerHorizontalPadding * 2 -
                  _columnSeparation) *
              0.6,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(),
            SizedBox(height: 16.0),
            _buildLeftColumnContent(),
          ],
        ),
      );

  Widget _buildLeftColumnContent() {
    double leftPadding = 64.0;
    _textFieldMaxWidth = _mainContainterWidth * 0.6 -
        leftPadding -
        _mainContainerHorizontalPadding -
        48.0;

    return Padding(
      padding: EdgeInsets.only(left: leftPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDeliveryTimeSection(),
          SizedBox(height: 16.0),
          _buildLocationSection(),
          SizedBox(height: 16.0),
          _buildContactSection(),
        ],
      ),
    );
  }

  Widget _buildContactSection() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Datos de contacto",
            style: Theme.of(context).textTheme.headline6,
          ),
          _buildTextField(
            controller: _nameController,
            label: "Nombre",
            icon: Icon(Icons.person),
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value.isEmpty) return 'Porfavor introduce un nombre';
              return null;
            },
          ),
          _buildTextField(
            controller: _phoneController,
            label: "Telefono",
            icon: Icon(Icons.phone),
            keyboardType: TextInputType.phone,
            inputFormatters: [_maskFormatter],
            validator: (value) {
              if (value.isEmpty)
                return 'Porfavor introduce un número de telefono';
              if (_maskFormatter.getUnmaskedText().length < 9)
                return 'Porfavor introduce un número válido';
              return null;
            },
          ),
          _buildTextField(
            controller: _emailController,
            label: "Email",
            icon: Icon(Icons.email),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value.isEmpty) return 'Porfavor introduce tu email';
              final regExp = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
              if (!regExp.hasMatch(value))
                return 'Porfavor introduce un email válido';

              return null;
            },
          ),
        ],
      );

  Widget _buildTextField({
    @required String label,
    @required TextEditingController controller,
    @required Icon icon,
    TextInputType keyboardType,
    String Function(String) validator,
    List<TextInputFormatter> inputFormatters = const [],
  }) =>
      Container(
        constraints: BoxConstraints(maxWidth: _textFieldMaxWidth),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(),
            icon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: icon,
            ),
          ),
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          validator: validator,
        ),
      );

  Widget _buildLocationSection() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Elige la dirección de envio",
            style: Theme.of(context).textTheme.headline6,
          ),
          Container(
            constraints: BoxConstraints(maxWidth: _textFieldMaxWidth),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
              ),
              child: TextFormField(
                controller: _addressController,
                expands: false,
                decoration: InputDecoration(
                  labelText: "Dirección",
                  hintText: "Calle Hong Kong, num 26, piso 3A",
                  icon: IconButton(
                    padding: const EdgeInsets.all(0.0),
                    onPressed: () => _getUserLocation(),
                    icon: Icon(Icons.location_on),
                  ),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.streetAddress,
                validator: (value) {
                  if (value.isEmpty) return 'Porfavor introduce una dirección';
                  return null;
                },
              ),
            ),
          ),
        ],
      );

  Widget _buildOrderDetailsContainer({double containerWidth}) => Container(
        width: containerWidth,
        margin: EdgeInsets.symmetric(vertical: 32.0),
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            myBoxShadow,
          ],
        ),
        child: StateBuilder<Cart>(
            observe: () => Injector.getAsReactive<Cart>(),
            initState: (_, rmCart) => Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tu pedido",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontSize: 26.0),
                    ),
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "TOTAL",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text(
                          "",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                  ],
                ),
            builder: (_, rmCart) {
              List<Widget> children = [
                Text(
                  "Tu pedido",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontSize: 26.0),
                )
              ];

              // We add the items from the order
              children.addAll(rmCart.state.dishes.entries
                  .map((entry) => ItemTile(
                        dish: entry.key,
                        units: entry.value,
                        isModifyable: false,
                      ))
                  .cast<Widget>());

              // We add the total price of the order
              children.addAll([
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "TOTAL",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text(
                      "${rmCart.state.totalPriceString} €",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
                _buildPayButton(),
              ]);

              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              );
            }),
      );

  Widget _buildPayButton() => Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Material(
            child: InkWell(
              onTap: () => _tryPayment(),
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
                      Icons.payment,
                      color: Colors.white,
                      size: 24.0,
                    ),
                    SizedBox(width: 8.0),
                    _isPaymentProcessing
                        ? Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2.0,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : Text(
                            "Pagar",
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
        ),
      );

  Widget _buildTitle() => Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back),
          ),
          SizedBox(width: 16.0),
          Text(
            "Resumen del pedido",
            style: _titleTextStyle,
          ),
        ],
      );

  Widget _buildDeliveryTimeSection() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Elige tu hora de entrega estimada",
            style: Theme.of(context).textTheme.headline6,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 16.0, 8.0),
            child: Text(
              """Explicación y descripción detallada de los envios y los horarios de envio""",
            ),
          ),
          _buildTimeTable(),
        ],
      );

  Widget _buildTimeTable() {
    Widget timeTableWidget = FormField(
      validator: (value) =>
          value == null ? "Porfavor selecciona una hora de entrega" : null,
      builder: (state) {
        return Container(
          margin: EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: _isWeb ? 16.0 : 0.0,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 24.0,
          ),
          height: _timeTableHeight + (state.hasError ? 17.0 : 0.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              myBoxShadow,
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _deliveryDay,
                style: Theme.of(context).textTheme.headline6,
              ),
              _isTimeTableLoading
                  ? Center(child: CircularProgressIndicator())
                  : Wrap(
                      runAlignment: WrapAlignment.spaceEvenly,
                      children: _availableTimes.entries
                          .map((entry) =>
                              _buildTimeChip(entry.key, entry.value, state))
                          .cast<Widget>()
                          .toList(),
                    ),
              state.hasError
                  ? Text(
                      state.errorText,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                          fontSize: 12.0),
                    )
                  : Container(),
            ],
          ),
        );
      },
    );

    return _isWeb ? timeTableWidget : Center(child: timeTableWidget);
  }

  Widget _buildTimeChip(String time, bool isAvailable, FormFieldState state) =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          elevation: time == _orderTime ? 4 : 2,
          borderRadius: BorderRadius.circular(8.0),
          child: InkWell(
            onTap: isAvailable
                ? () {
                    state.didChange(time);
                    setState(() => _orderTime = time);
                  }
                : null,
            child: Ink(
              decoration: BoxDecoration(
                color: isAvailable
                    ? (time == _orderTime ? Colors.amber : Colors.green)
                    : Colors.green[900],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  time,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: time == _orderTime
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

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

  Future<void> _tryPayment() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    ReactiveModel<Cart> rmCart = Injector.getAsReactive<Cart>();

    getCurrentPosition(allowInterop((pos) => success(pos)));

    if (_formKey.currentState.validate()) {
      if (_userLocation == null) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text("Activa la localización"),
            content: Text("Porfavor activa la localización para continuar."),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("OK"),
                ),
              )
            ],
          ),
        );
        return;
      }

      setState(() => _isPaymentProcessing = true);

      Response response = await _firestore.runTransaction((transaction) async {
        setState(() => _isTimeTableLoading = true);
        DocumentSnapshot scheduleDoc = await _firestore
            .collection("agenda")
            .doc("delivery_schedule")
            .get();

        double userLat = _userLocation.coords.latitude;
        double userLon = _userLocation.coords.longitude;
        double centerLat = scheduleDoc.data()["center_coords"]["lat"];
        double centerLon = scheduleDoc.data()["center_coords"]["lon"];
        double maxDistance = scheduleDoc.data()["max_meters"];

        double distance =
            _calculateDistanceInMeters(userLat, userLon, centerLat, centerLon);

        print(distance);

        if (distance > maxDistance) {
          setState(() => _isTimeTableLoading = false);
          return Response.NOT_IN_BOUNDS;
        }

        Map<String, bool> availableTimes =
            Map<String, bool>.from(scheduleDoc.data()['available_times']);

        setState(() {
          _availableTimes = availableTimes;
          _isTimeTableLoading = false;
        });

        if (availableTimes[_orderTime]) {
          _firestore.collection("orders").doc().set(
            {
              "items": rmCart.state.dishes.entries
                  .map((entry) => entry.key.toJson())
                  .toList(),
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

          setState(() => _availableTimes = availableTimes);

          return Response.SUCCESS;
        } else {
          return Response.NOT_AVAILABLE;
        }
      });

      setState(() => _isPaymentProcessing = false);

      switch (response) {
        case Response.SUCCESS:
          await showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: Text("Pedido confirmado"),
                  content:
                      Text("Tu pedido llegará el $_deliveryDay $_orderTime"),
                  actions: [
                    RaisedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Cerrar"),
                    )
                  ],
                );
              });
          rmCart.setState((cart) => cart.clear());

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => HomePage(),
            ),
          );
          break;
        case Response.NOT_AVAILABLE:
          String selectedTime = await showDialog(
            context: context,
            builder: (_) {
              return TimeSelectionDialog(
                errorText:
                    "La hora que selectionaste ya ha sido reservada. Porfavor selecciona una nueva.",
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
                  title: Text("No hemos llegado aún 😔"),
                  // TODO HACER TEXTO MÁS EXPLICATIVO
                  content: Text("😔 Lo siento aún no realizamos envios ahí."),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Cerrar"),
                      ),
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
                  title: Text("Error desconocido"),
                  content: Text(
                      "Ocurrió un error desconocido. Porfavor vuelve a intentarlo"),
                  actions: [
                    RaisedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Cerrar"),
                    )
                  ],
                );
              });
          break;
      }
    }
  }

  void _getUserLocation() {
    getCurrentPosition(allowInterop((pos) => success(pos)));

    if (_userLocation != null) {
      _geocodingService
          .getLocationOptionsFromCoords(
        _userLocation.coords.latitude,
        _userLocation.coords.longitude,
      )
          .then(
        (optionList) {
          setState(() {
            if (optionList.isNotEmpty) {
              _addressController.text = optionList.first;
            }
          });
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("Activa la localización"),
          content: Text(
              "Porfavor activa la localización en tu navegador para continuar."),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () => Navigator.pop(context),
                child: Text("OK"),
              ),
            )
          ],
        ),
      );
    }
  }

  Future<void> _loadDeliverySchedule() async {
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection("agenda")
        .doc("delivery_schedule")
        .get();

    Map docData = doc.data();

    Map<String, bool> unorderedTimes =
        Map<String, bool>.from(docData['available_times']);

    Map<String, bool> availableTimes =
        Map.from(SplayTreeMap.from(unorderedTimes));

    setState(() => _availableTimes = availableTimes);
  }

  success(pos) => setState(() => _userLocation = pos);
}

enum Response {
  SUCCESS,
  NOT_AVAILABLE,
  NOT_IN_BOUNDS,
}
