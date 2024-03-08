import 'package:bmi_chirag/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'build_Container.dart';
import 'constant.dart';
import 'bottom_button.dart';
import 'round_button_icon.dart';
import 'calculator_brain.dart';

enum Gender { male, femle, extra }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  _InputPageState createState() => _InputPageState();
}

@override
_InputPageState createState() => _InputPageState();

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.extra;
  int height = 180;
  int weight = 60;
  int age = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI CAlCULATOR',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  // male container
                  child: buildContainer(
                    onpress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kactivecardcolour
                        : kinactivecardcolour,
                    cardchild: iconContent(
                      icon: FontAwesomeIcons.mars,
                      label: "Male",
                    ),
                  ),
                ),
                Expanded(
                  // female container
                  child: buildContainer(
                    onpress: () {
                      setState(() {
                        selectedGender = Gender.femle;
                      });
                    },
                    colour: selectedGender == Gender.femle
                        ? kactivecardcolour
                        : kinactivecardcolour,
                    cardchild: iconContent(
                      icon: FontAwesomeIcons.venus,
                      label: "Female",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: buildContainer(
                    colour: kactivecardcolour,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Height",
                          style: kLabelTextStyle,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  height.toString(),
                                  style: kNumberStyle,
                                ),
                                SizedBox(width: 6.0),
                                Text(
                                  'cm',
                                  style: kLabelTextStyle,
                                ),
                              ],
                            ),
                            Slider(
                              value: height.toDouble(),
                              min: 120.0,
                              max: 180,
                              activeColor: kbottomcontainercolor,
                              inactiveColor: Colors.grey,
                              onChanged: (double newvalue) {
                                print(newvalue);
                                setState(() {
                                  height = newvalue.round();
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: buildContainer(
                    colour: kactivecardcolour,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weights',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: buildContainer(
                    colour: kactivecardcolour,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: bottombutton(
                  buttontitle: 'Calculate BMI ',
                  onTap: () {
                    Calculatorbrain calc =
                        Calculatorbrain(weight: weight, height: height);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultsPage(
                                  bmiResult: calc.calculateBMI(),
                                  resulttext: calc.getResult(),
                                  interpretation: calc.getInterpretation(),
                                )));
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
