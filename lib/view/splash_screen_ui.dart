import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taxi_app/view/home_ui.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({super.key});

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {
  void initState() {
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeUi(),
          ),
        );
      },
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [SizedBox(height: 200),
            Container(
              width: MediaQuery.of(context).size.width * 0.95,
              height: 400,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 202, 56),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/taxi.png', width: 120),
                  SizedBox(height: 15),
                  Text(
                    'TAXI METER',
                    style: TextStyle(
                      fontSize: 40, 
                      fontWeight: FontWeight.bold,
                      color: Colors.green[900],

                    ),
                  ),
                  SizedBox(height: 13),
                  Text(
                    'THAI FARE CALCULATOR',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[900],
                    ),
                  ),
                  SizedBox(height: 50),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: CupertinoActivityIndicator(
                      radius: 20,
                      color: Colors.green[900],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 170),
            Text(
              'ID :6635410003',
              style: TextStyle(
                fontSize: 23,
                color: const Color.fromARGB(255, 87, 87, 87),
                fontWeight: FontWeight.w100,
              ),
            ),
            Text(
              'NAME : ภาณุวัฒน์ กันต์พงษ์',
              style: TextStyle(
                fontSize: 23,
                color: const Color.fromARGB(255, 87, 87, 87),
                fontWeight: FontWeight.w100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}