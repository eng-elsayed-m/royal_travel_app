import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:royal_travel/model_view/auth_model_view.dart';
import 'package:royal_travel/model_view/booking_model_view.dart';
import 'package:royal_travel/model_view/buses_model_view.dart';
import 'package:royal_travel/model_view/location_model_view.dart';
import 'package:royal_travel/view/screens/navigation_screen.dart';
import 'package:royal_travel/view/screens/intro_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthModelView()),
        ChangeNotifierProvider(create: (context) => BusesModelView()),
        ChangeNotifierProvider(create: (context) => LocationModelView()),
        ChangeNotifierProvider(create: (context) => BookingModelView()),
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: const Color(0xFF3F51B5),
            accentColor: const Color(0xFFFF5722),
            fontFamily: "Kanti"),
        initialRoute: IntroScreen.nV,
        routes: {
          IntroScreen.nV: (ctx) => IntroScreen(),
          NavigationScreen.nV: (ctx) => NavigationScreen(),
        },
      ),
    );
  }
}
