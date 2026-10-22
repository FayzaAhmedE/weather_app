import 'package:flutter/material.dart';

class NoWeatherScreen extends StatelessWidget {
  const NoWeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 218, 99, 99),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 1,),
            Image.asset('assets/no_weather.png', width: 200,height: 200,),
            SizedBox(height: 20,),
            Text(
              'No Weather Available 😓! Start search about city now ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,                
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(flex: 3,),
          ],
        ),
      ),
    );
  }
}

