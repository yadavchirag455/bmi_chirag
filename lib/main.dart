import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //primarySwatch: Colors.red
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff111023),
        ),

        scaffoldBackgroundColor: const Color(0xff111023),
      ),
      home: InputPage(),
    );
  }
}
