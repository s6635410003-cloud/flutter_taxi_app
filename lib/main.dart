import 'package:flutter/material.dart';
import 'package:flutter_taxi_app/view/splash_screen_ui.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const FlutterTaxiApp());
}
class FlutterTaxiApp extends StatefulWidget {
  const FlutterTaxiApp({super.key});

  @override
  State<FlutterTaxiApp> createState() => _FlutterTaxiAppState();
}

class _FlutterTaxiAppState extends State<FlutterTaxiApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreenUi(),
        theme: ThemeData(
            textTheme: GoogleFonts.kanchenjungaTextTheme(
          Theme.of(context).textTheme,
        ),
        ),
    );
  }
}