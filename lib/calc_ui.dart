import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CalcUI extends StatelessWidget {
  List button = [
    'AC',
    'DEL',
    '(',
    ')',
    '7',
    '8',
    '9',
    '÷',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+'
  ];

  bool enabledDark = false;
  String ans = '0';
  String val = '';

  CalcUI({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.sizeOf(context).width;
    double h = MediaQuery.sizeOf(context).height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: enabledDark
            ? Theme.of(context).canvasColor
            : Theme.of(context).primaryColor,
        body: Column(
          children: [
            Container(
              width: w,
              height: h * 0.28,
              color: enabledDark
                  ? Theme.of(context).canvasColor
                  : Theme.of(context).primaryColor,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ToggleSwitch(
                                totalSwitches: 2,
                                iconSize: 22,
                                initialLabelIndex: 0,
                                activeFgColor: enabledDark
                                    ? Color(0xff6b6f77)
                                    : Theme.of(context).canvasColor,
                                inactiveFgColor: enabledDark
                                    ? Theme.of(context).canvasColor
                                    : Color(0xffdddddd),
                                inactiveBgColor: enabledDark
                                    ? Color(0xff2a2d37)
                                    : Color(0xfff4f1f2),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
