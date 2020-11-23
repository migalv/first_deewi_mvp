import 'package:firebase_core/firebase_core.dart';
import 'package:first_deewi_mvp/pages/home_page.dart';
import 'package:first_deewi_mvp/stores/cart.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // data.update();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.amber,
        accentColor: Colors.amber,
        cursorColor: Colors.amber,
      ),
      home: Injector(
        inject: [
          Inject<Cart>(() => Cart()),
        ],
        builder: (_) => HomePage(),
      ),
    );
  }
}
