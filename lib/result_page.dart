import 'package:bmi_chirag/constant.dart';
import 'package:flutter/material.dart';
import 'build_Container.dart';
import 'bottom_button.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {required this.bmiResult,
      required this.resulttext,
      required this.interpretation});

  final String bmiResult;
  final String resulttext;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculation'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(25.0),
              child: Text('Your Result', style: ktitleTextStyleWideget),
            ),
          ),
          Expanded(
            flex: 5,
            child: buildContainer(
              colour: kactivecardcolour,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resulttext,
                    style: kresultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMItextstyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kresultTextStyle,
                  ),
                ],
              ),
            ),
          ),
          bottombutton(
              buttontitle: "Recalculate BMI ",
              onTap: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
